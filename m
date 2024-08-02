Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099C2C3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Aug 2024 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgAnTzCp8eEzomrj8ewm+47pD4cRBX96G0mhCFGASRY=; b=5G6vlzxNXa1/8+HZ+YpVpvyKsP
	We3pNBDzBTPzrl78qY5v6i4bhDKG2Y3JHOV5C+nmq2wAuNC7JkC+PkFb/QlLHVPIyoISO6kzubGys
	AtLf6qRtYtD0LFlM20RYPNxkSzh+lZ5n6YzJKmoXYZFEWZfRiYqZH9rnT2R0CcmuLaSeUXhn4oUA0
	+4aGrcc5Yu6BxUoT3sd4c3ZU3+xL2f3NiA9JxPf3Ju/jRJNzKwi/n3Nu3wzuCcvSbxc1so8DBFhUd
	xdg9/lWFHgXm9urC8neItc3keX1wCwu34R6diRE+0r549rZ2T8JRMXVXTGq6zE7fCG/WCOgmRHwG8
	QUQznBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpuA-00000008ZCc-0XgA;
	Fri, 02 Aug 2024 10:53:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZpu6-00000008ZAk-3lVj
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Aug 2024 10:53:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E25D7629D9
	for <linux-mediatek@lists.infradead.org>; Fri,  2 Aug 2024 10:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC0DC4AF0E
	for <linux-mediatek@lists.infradead.org>; Fri,  2 Aug 2024 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722595977;
	bh=iQMzad7kELPKfYfZYzFJ19ATnCtIUZ3I0vtOF7oMT4c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=fJaWjMAW4cM42G0a2ACRnfyu7WhTguZVbWD09iTOdFrgktEjfc/SwQknhw/C7LJ0v
	 yLAS3GxQcMyW+ag2qW1ZvDpHZ9d42ZbO35ae4Ga0QnbB75zvjR1RE9Ehq/FrmtxS5i
	 uKmQWwaHMEc1/WhVyTIsFXYHo6dFzrgmMne6Nq9myg2WfT+azOJl+St7o1cydjWTDN
	 O7Fh5WtbJPbzaHYJbWt3PzYK2HX45LpQv33mTbezbW/Dx2lMlgTgslKMUdRISuLOlh
	 JZZwZMDjvQ4KkSNjiO4mMcPjqFda1wSuHXJOskFP1XrNDW5oymL5TRO0Wu7lvrFk2e
	 os+OZAQayS5PQ==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-661d7e68e89so25738077b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Aug 2024 03:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUR/DckHyKfITQScXe8L5ICzA+Z0wZYPv089Lp7BMReh2Mx4sbCsgWcJ2MDZL47qpnBTXUM3sB03F7+GR90IICau2E8WXHDldYQ9F0mDYbUhDjs
X-Gm-Message-State: AOJu0Yx4nghywyLKuOfPXS0jceGqQ6IB9u+UmTsECm1oRp/xzUlt4DU4
	qKg2o7+/+GvGNFw3HB4CIOX4B1B9Tf35bGXKpJTC4haBKe0/9yRWdWh7x93k7bBxf3k1VycjNHH
	IqHmo4WOhSbuuy/lSJzGI1RGlqtY=
X-Google-Smtp-Source: AGHT+IH9jkA5SQiI2/cQG6X7OkaPUp+PZO7osj0d7kUIy3MXdrgHegJudVZPDKKY8fCID9RZdWAtImvzV2zxOM5MH6M=
X-Received: by 2002:a0d:f781:0:b0:66a:bf53:e077 with SMTP id
 00721157ae682-68962d6401cmr28005607b3.16.1722595976808; Fri, 02 Aug 2024
 03:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240729071010.6129-1-xiangzhi.tang@mediatek.com>
In-Reply-To: <20240729071010.6129-1-xiangzhi.tang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Aug 2024 06:52:45 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6OhgYt0jqF7M2FRzBYffO6XUig0KLzCiC1Ufo7H1qxUg@mail.gmail.com>
Message-ID: <CA+5PVA6OhgYt0jqF7M2FRzBYffO6XUig0KLzCiC1Ufo7H1qxUg@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Update mt8195 SOF firmware
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	joe.cheng@xperi.com, hailong.fan@mediatek.com, justin.yeh@mediatek.com, 
	howard-ch.wang@mediatek.com, sidney.chang@mediatek.com, 
	Jjian.zhou@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_035259_096112_064187DF 
X-CRM114-Status: GOOD (  13.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/265

josh



josh

On Mon, Jul 29, 2024 at 3:10=E2=80=AFAM Xiangzhi Tang
<xiangzhi.tang@mediatek.com> wrote:
>
>     Update SOF version: sof/sof-mt8195.ldc
>     Release version: v0.4.2
>
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  mediatek/sof/sof-mt8195.ldc | Bin 51168 -> 40560 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/mediatek/sof/sof-mt8195.ldc b/mediatek/sof/sof-mt8195.ldc
> index 0ae937dd0fd153d3169b90291836705126542dad..80c5394b3692b45ae3d9a5452=
3049c0cdb198874 100644
> GIT binary patch
> delta 190
> zcmaFR&-`Hz6PHhZdNBjTii9WACvs`<nVTCJS~4&gFtGmQ6S%g~!NFs*K!}Xc<P~N-
> zo3}LYVc%TR?WbXCW~Q4CR%wuGkYr?#s!&{%tdNmdoS|S)p=3Dw}Jp`ekI0vAXzGc+(r
> jO|zW*eRDi{IyZN3*~`Odu-WrqJL9Co2AdNOH?RNz0`5Mp
>
> delta 10115
> zcmb_iU5wmT6?WQ06;WvtHtB{6nwyYKHtlZqr)f!Mvn9LP&~DNsO;V5u3a;0_Giy3y
> zPduK@PHAOSL@QdUKNvwPBz|5hgg|OosR$@)5JCmSOC*G-KmzfQJb(n1kPs3NeCPVw
> zbFarUJDb$1YtL+azVrK?bFb%LZ{70Omu}toh+k<K#`hlo_mx*R4&ULFCk{*)#<;Oz
> z<)uG7bNR@ThhI6eHM+$xjLYi`<1SohaW(>b%xXHWKgKVbt{ce9e%nYso37`ErtS0c
> z@V*fi@J8MD8k|{;hFkGi*$>!Ili7=3Dw=3DkaP|gg&JIreWL)`E&rz_)CHr8TaDD+Cc3^
> zHsmn3!5Tbdq0bgtb-<Hg72ujQs?<|{RBYA7CU1n?$#f?`zHD>uG?>H7uE!k>>^%uK
> z*%Pb)D}oVr=3D)#B0_M2X)0@bYL41~h;9|<zPRuIHP_gESdHWWD!mbwkM#x#&97e0t{
> z)v$Q{((pe0`IdbCj((mm2NCCxpepbKDPVIy0_s*^)f%LOCgX~fG2BxIvfGU8nqyXY
> zXgXGCQAVFT{YmraV`m>RkDi<}XXj7Noc&Br`0x7`PO_1sy<|r@;n$_`zT6M_dH4TM
> zKEI`><uVb&z>O*u9^{40As&<ieF>=3Dt98sVsW+8wMMp??ZueTzzf@I80$Ovor&A{d+
> zn51Tf(?brvalI$npCK;;qWduZ#j$Ni6N@^?N|8H1f0j7I_Pw%OX$IWcugiIw<VZT`
> zC5O0XG+Ye)W@VApe23@cydVwV1l?9GAQU1GMf#E{hC%6oD$kA|%aUI^NxI&WRdt<=3D
> ziW7Pv!K(b9N%{BSdr~&)pZY(>{IcN3j2MZpRN=3Dd1F7A=3DSd&-6%n)Trb73lD))nZn)
> z>f07EBP&~OH4{t#b5iiZegq4S8iDz|Ty|}jdtrkuRQ&~{)svk1Q_Aa5-yNtmYY?hh
> zaXy}y>zWrrcnQL5by4LeNjA~_oGK4Y@mHa~$TnTBEsYrI$B2)pK%xT^UkS9~eeurI
> z1MwFRuOIog6nTFiBID-d=3DoC^{HT4boJf?(IQ#Zakd2ggW{VVzO?w(H*>E<~%%T>Qt
> zgX{3Ts?{I6%8k_VBo(X@Zg0WwNx^sbR9JGQ;Mx(UNsOSYs_C#Seb$#izuuyTL)nc<
> zgXl@rfMPxLGcHJ(Qw1_N=3DXok-$L6L#zZNYNf)wa!E=3D6@IWk&&S9#*CAQ$DK)zRk)_
> z&&H#ge_H*^yer5H1??t6SDt=3D&$A_ZS@8qK~oYd+c#M!1?8{BN0mSfdJ9*k+9FwJV8
> zlS&<7mjd6bAjb7($db`wCv$=3D&HqC~XQRLJ)#61ypssJzzDmYT$FwUD&Kqdo*TFHN$
> z)p*ShT4J(JXofEVn;L~Yrg0^3ebCkH>(Bb$;AnNtDhG}*{C0UWPvG&E(m=3DFEXEPoI
> zv{-P6J%wYdzU8=3DZ|DuIJi=3DqHMwG)V7A0;%L2XN;69IYkN5*8{W*ly^eQ$E@5HJI(y
> z;9ioTIxFV=3DtJ>d@URjlu<aomtn&mPNnCFLxY*TQa2Ktl)rPR(@T5Ra%JSezedwg-j
> z;D#4TR6KKNEg{MjPQ$cJVIqIYzsLyb;dw(UJzK2wJ$)3S6d(WNz^=3DPZ(V<a$O~_Lt
> z@}{r|Nq4gUq{}QSrHrc<8O<8i_~hBa4ZjnzFHa5Z>sxmG)a0H!J970?(0Dk8p!vQ9
> zVOdQ*LGgLjT@ZB2vAp&w@x*h3(Rq>!C8_ND%8Yzs6r-T(yuDyOa5uovkSwniE&>!V
> zs`Ec>eCMVWpcb93+!A9;@%5>Xg45C{)Ae<Uqj$c1-6_uPFth*%6({+o86*{-jDZ+B
> z)}@?EE#-$2{50-w%*#dK?YR>xk<iE11saN7t|YVQ2WYWFyniYF?)HJ`M^c3c-d7cx
> z-V>gG$xBH$Y}GSP2M!%SNpKg8qxf+1wuAEOmW>@EWuOP~W1wa6$s>bb-Mc<|TUvVI
> zeF2miMUj@h(^^71u@<UabkP9YEN+d<29E|1ku$Ij(+u4u&ZrHM8=3D#Xo=3D=3DvwA;6u2-
> zd5<XdEwXtVOI4Dc(5ly~t@xjNwr!v-A3-8&d+F@vme^)ka6Kz%$=3D!z33u(NQKQdZ2
> zFd6jBM6z=3DuvYu#VwAjR`5AL?ZpsMV5l-SJdJgd14tmEy)odiO@OpnbH@Fc!i-KP;|
> zxQ_bH0gC-V?lo()&Zo}m*6LMW!-@}dMmv)lcW8u7N)1Ydiifzq#z;+}d;~xUiTg3e
> ziDi!JjZp%R&rGeQNsA>3OE<4NEN=3D0TY*bMuq>1`=3Dg65W}GrQC|n$~V<hbpl&xl)TV
> zFakXx!Sq$S23COekV5FD+#V^V6$5@0&(ppGyxE=3D<HQ)<3;LCDA8<Cwr^nEt#7!aHt
> z&*F{>W(H@M{9VnL%1olUMHpsP18zAjw!pcUPF)%?VKHSeoZXc;r!0NOD%|6NYomyg
> zN!}!)!z@6vH(6e|_Tfud`M~LDQCI;{tBlVa8;It5!mb6iV9k-V3#wPdxLKE-N-fu<
> zQ4?{H?fMR*=3DEx+!RyAGhlqJ&u_Ov7kCz|bS7ZBz2MS%(YBe>}j^=3D_cF(jZ4;pTFve
> zYQ=3Dj5hqe&0u0k6E!<DH~lI7`_4&1Kg_A)6@yx!_GGewlr5J3<l2$^O{MigX)w6x5i
> z#XA%-lMc%DFXJQ^&*IEk>*>poZs1wvmQtG<b#A-Zi4!X?Sz06Vk0v%OVQ|~$xHZ0x
> zvu~5rWwV*I{t}oXeV3yQAc*ofUK@qHp{5mq8Q&r_oCV``Zi(4xatC-pcFU0jNfugo
> zjTC4Kkng`Q6_~+Q_j#1t&A2HAlq?%s?oi^lQi)HfO62IQTb>hTX6_fO{LY+D_B84~
> zrJjRGu%UW8=3D#+Waqyonk1tMSX7u^)dXthW3$$wLjf8)zq29h$jAuh;?cx7r!=3DN#4<
> z1-XW5lWHThLQdP|Ss~)3hWKtsV|2pWl3*G7ws6L3${f}MSTVdEXIWg7V{{PM9tqZa
> zYXcoQ!-}%@A%@hffAm5GkP132L22tqPw-XqJKzy|LOOqlT^#Asj8){wkS_8&%m*kn
> z&h#kbhRS^_&VH1Mlm?p6D@8I0HKAXTLI?U3+9}iVJuJ&8M0C)#oOmrV(pNRf+mtLZ
> z+Vgo9t1ML7a8sgJ!3AzfLqu2F5#NndD}PaLm3)kxuz`^R|2Oe|1+TKrj06+a623#o
> z3b+u82ol!w;~4@k9)-u+Xo++g0(^bWFVCkfbRL~H#RG;YveZ2C<*U*>edE8wmAjDl
> zT>zyqL-FOkgNx*;Rab@`lG-e#IIr&4n^lm7nd}eB@{(H>@yoYukAB*p?ggs10aNXX
> zd{n<&m9q60cA8&g59qLl0)ZWSv3b-Ec9HY{E<twU+PmWNz9;dUusNm57vm`LGX-IF
> z8q15!kytYNjXo$=3D$(WVo+a8F{{6zN~C7zr-Bl&|F%~7&BtpX@EpR$>=3D4Lq&`Zk2$i
> z0N&}dNFBIu5U^?m_#prb@#+$j;j$ozxyR0l1#8ZFCY8yEC=3Dx#xx&iCO9w5!6Z9hY{
> zIOsYqfmVC16LpqpF0OEj$`3QNzj8Er>(H$hPDt<_P^8o4n#ZGz0uvwPT97P))G{KV
> z&q?8{5Kuu8CseMJ8`@0T($+)xi#T@|@Ans$Ey{@^jUT?Sj6vBF4;u9DeaP9L{->jS
> zjZkoQ*)O7Ybht|mNYWOdb0><SjFoSm|IKYHk1w1ZzJK!2Xhr;ZZSnx;6SmC|4_YEG
> zGR$h@2bbA!)ycj%IO#lau)J_zeEoUz#-3dH!V5pYecj6|hhBYd-JRF2JbLE8dw+fE
> zOK0BM@aF7Qy!jl(i{|+C*N%Vq^e@eKH+}q_<8M9t_Mbodx0!25GVnEqrImMI`^NhJ
> E0}ttrg#Z8m
>
> --
> 2.25.1
>

