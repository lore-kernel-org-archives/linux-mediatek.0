Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0CFC27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 10:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fzUt45MrMqbhQMl8Gn07LjHhsuv8Ddxhoxq1w6fqRU=; b=fppISQ/ArQhTpwvXQUb3cLIM+l
	Eyy/Iu20zyCYgbsiL/SpGHW7OXlVyu/5L9RmnmKviFnCNzbhvHwxRk6J04PKkqvwLuM3VZHpAK6aP
	Se5z8pmsTB+AEYXdXnpYS45PUSwj3nZtgLFNAaoTI9vZNTQ1Sw92w8jB5Iuum3trCiPAHUmHxdOjM
	dbgr1MyxL5+C8mX8WzDcweJ5xVpQl82C04Uprpd3aaWp1ZALA5+O87/3WkqxXSqifYUme+XVXGdyj
	aKjJy0wrHhj/j/6GqtyBhEsUiM3IWERuiCUCET7LzOn1KUpPy0Jy3xvL81p+qYgZ08md2NfEyFkxb
	07TVecQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKyE1-0000000BtCS-0Af5;
	Sat, 22 Jun 2024 10:44:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKyDw-0000000BtBS-3Rmg;
	Sat, 22 Jun 2024 10:44:02 +0000
X-UUID: 525b37ca308411efb2966dae1f787272-20240622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0fzUt45MrMqbhQMl8Gn07LjHhsuv8Ddxhoxq1w6fqRU=;
	b=QRazcajbTPBD1x4FVDPKYyi2DAL8zdfqbR747nGgSAIHn5DWCoH0WiuV1lESwrVX74Ol/irj+jPS7vRcMO5hZegT5A7tdJCLXTBHcNHQ9gKQli7ElyH7moygevxKrTFsJbiUv0dnaWj+xgd1uYEag0KPH1qwel64CXMKCiPeqEA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:7b8f9b8d-f138-4b18-93d5-98a06e0aa18d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:2575e344-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 525b37ca308411efb2966dae1f787272-20240622
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1243073773; Sat, 22 Jun 2024 03:43:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 22 Jun 2024 18:23:50 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 22 Jun 2024 18:23:49 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0
Date: Sat, 22 Jun 2024 18:23:47 +0800
Message-ID: <20240622102347.7004-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240622102347.7004-1-irui.wang@mediatek.com>
References: <20240622102347.7004-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.669000-8.000000
X-TMASE-MatchedRID: wYKjk3ae4OLuHXE92Wk6HBn0UD4GU5IqSjyMfjCRfaPfUZT83lbkEDtJ
	rqfEN3+5Z71U+LGak4oDsZVQkxRZovWzx4I556JgL9hNDj2bBwd9LQinZ4QefJOK2Na/r7MIF70
	JBot7Y8/3FLeZXNZS4CiM3WUt6LtFp1ZPf4GFkIzfTc81a+kOdGBbFccaCtlC3vTPUohQJLlQOh
	VbxuDcqo0sb82d9qK0E5gwvIyfLggxWfhuF2AQwQBKCPb31CFrHP4+GiOUtS56/Rg9M3zrxAGqr
	7/5oYKxS7Rtx98AtcQ=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.669000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6B481A3084A40AF9988749B39C7AA47F348243FDB4EEF4E2C507B6CD4BF03BE62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_034400_988410_5D770730 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

[h264 decoder]
check if the h264 decoder instance allocation is successful before use.

Release Version: 1.2.0

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/mediatek/mt8173/vpu_d.bin b/mediatek/mt8173/vpu_d.bin
index a9e832a1db1908a1b91da72cf64746d56283c4c9..20382f3f148c3db18e4184692620f6edb819053c 100644
GIT binary patch
delta 200
zcmWN=w+R9P002PVH|Lyl&WIa)Z72Lh7Ovq4HsUZY;~m`V_X%FU?@@R?UmkJvjHAGW
zp-EGw&6qW3-hxF-maSN|X5EHOTej`kwP)XfLr0FCICbXSg-chi-MDq<-h;<)9Gz~*
EKf@6|9RL6T

delta 200
zcmWN=w+R9P002PVH|Lyl&R}WzwVm)2S-6HH*oecpjCXLa-zRwazDMEZe0{{xGmZii
zh9*s!He=SDc?%XTS+-);nspmCZP~VC*PeX`4jnmm;?$XQ7cO17cH`Eadk-GJadf&J
E|H$7yB>(^b

diff --git a/mediatek/mt8173/vpu_p.bin b/mediatek/mt8173/vpu_p.bin
index d753236ec0791d8ba1ba16d01d0dacc64e6189b0..e5bbb7337f72df7c9647258aea47097da8a289c1 100644
GIT binary patch
delta 858
zcmYL{eQZln7{<@jb=@hu?(VcxHtVb!BqS4p5KBdoQXgZ<_`_I4&G!}(5?`m?SbdW_
zyNUQ`IJt(<Wwje5WJD?=F(26$5jLY)f@ETnu`j0xf4zB6&hxzQ?>Q$LqR|kI+;pSA
zA>y8pDN38?%pKG>Z0?g`S4O1~=G$6(>B>BP>Iy5Zy&b$3Q&096nHJgAcz+&B)KLR#
z5LC+twoJ0cc^7TvNBCuai!)~@uk?X9vs22B`KpJA+{*0|aD*#1)jT-GL}hi_U<oSK
zbAz5kvzVj8-WrMV_MW(Vm_IO+<N!oguGC2&ah*9IcEveJ&TD3~(t_(To>5xV*r799
z6K~=9_dI&3y0@;SZjdp>N;^0qN?FL4Jknx>r|<fhY9=yiTr8QUxWc(ad1a;+Lgawg
zB{k_ujTXY3s(;Aq?cgk$LWYwz_i+DA{i46B+v@L~bbbkuH`R@nOr%`TZ7b4Cb(0X_
z$$_lL1J3L+(!n>@W~3ghU8uJVW2E8f&;}rC<N^21uxZ`N@WG?aw&1SP1Bv?c^m%%L
z{+lhLSyIraFhzRFKL|MCnm}e+I)zJ!W>B0Q*|SH_$U#}VZG|5AD>GUs3e1RT6D4d%
z#Hf+53^Y?@%bbc?`#b`9|2kv5j7}3g22DqKlE~cHXUBUJyjrmXOTdh)4y+YIjgCPj
zmH&89qk0S~fM(5+g$079I168ZLc^bpIcDtD!nr8NdhKT}#-i77xbVn|e&g+Aq_3)B
zc!zGSoneE}dxJP2%pU~db2NYBfx-l3B|pnc3O$zJv{cqyA>6=j?L`Q4MM<kbD|Q=Q
z75ECQHeMgbd=aRYU4`YscSjX69Eml*bA>YJOHO1Ei2flL!Ck1rPH{IijHzOHei(}s
z!4yc$`k!u17*4TMV;G<CM!R?vKg5^|$It}4F^W%MsYx7PKZR$a>_3edY=-v?z9fx{
oW=fqrCjMd%Kkf(VoB!P1ZDG^vb!7d0xRupdm&mxG8o_P902Cu8NB{r;

delta 823
zcmYLHTS!z<6g_Lajd!v;<F#>`%$!n&6bi-?3Mw1P9#d9Yf(Sh@YkJ$ApZqDfj)qhA
zl52A%{800BlcWsIOBR$x_#=h+F%nUlW<n2&j3#__rlh_Wd$adid#!WY{d~KhZ@uHh
zr?yt-k_8O<-B&tM)OKXtg7_|5ERj9O8m`~W($aHHe8c^+Tcygyi2}n<t1>d-f~d@!
zEJU^9n>?DvjnGj(M1!=6-lMW(h*o$&97)mAc~8wWv4m*600gPXDcsaDL)fgWm?}bz
za&^kRf4OWgj}Nti42%)W)6r%&Xss1*g2;|;IzkVvB#Uf^O?)>kYANU#)Vk;?CG(+d
zb!)v;7WwAN<~Q=7)9(=_6F+M%A<=rEz4-kcj#x;?7QwizIN(**O&6|-A#!_64oG88
z$Z5(+*RE~#eMR$!G@cMkpntwFNb@wGc1YuyE}oxB?3r{V^~OjfOFP)m_IkP)Xwu!l
zBMw~92oGH979$>r!w~o!mzJgFX#lZ^^{Ooz<Dw)AeRP;cO#Ep}YBG-$wzQGQ#ks?!
znr#uJ0c)=2omtaIc;s=YS62x*fqMOhfbHNDSQxTH98)LEaQ&<F3=4(~aOw6q_@Y>v
zdR08$8IYlt*s&Fo-f71kKvL}qsNl_iIl_8V0?L8MYHA`jFf%2I_zYz0yOXe*!(p{H
z89wByvs17Tqk3uzo|*7T|FRTuyQ=GBgEHP?Kpl`#%qX(UaE9?eDTBxU_&fFHM~qg`
zYFd=<HvTajHmfOq+{OX*r5|e<#Fit31Nvw=z5$!{S7))FMXDxMVh7_bsf5iQx%3AW
z!?L4~5(@}e{gjH5T33maY<5ln=}bH`fK6i9EO;YY{{s#N;9xg(1n?0(YU4TlVls8-
z(FOGAdoN&{fwfyM;RS=!m(dMQ&%T1sQHz@v2t%}6lO1EUihYpr^}WuoMmgiIhQyh-
P+gXEsk(k?RP<H$`@2?=S

-- 
2.25.1


