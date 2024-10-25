Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D091AD116E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 03:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8qmEpQ66gE8tk6cXVsBlD9+MFs/Iqrcf7Wuf1YPEUg=; b=AhEqHr8Ka8sSnhvDOOh0Xbib4H
	obvDoQCU+PVPWxg4SFUkFPmXyF86kv+X1ZpFTuaxJtF+ZIREYTQQp2RyvO/hzVrpjSl0WgDCLi1XW
	l3CxInCwW2DCp7R56Ft87gMNP6RIHT/dLIoEu9peWRfPZ0UKWWHQ0kz60Dbm+HYhuyFbwRwfVM1Ef
	zq+6lRqRRYOwtqbwWQKOd2YrlOEEVXOKGk61k//hnbqqhzG7alat+KMjG0lqV4MP+k2G4XIYTu1u9
	TksqmJk36saLFEuPYkXBUBuLjLuLVbu5FlJuK8ydj16A+Ve+80kf2DGWxen0VcEPvOs2EyGttSpUU
	FJmze5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ard-00000002MtR-2Zz2;
	Fri, 25 Oct 2024 03:19:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4AqY-00000002MhF-1lFL
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 03:18:43 +0000
X-UUID: d4bfa694927f11ef9048ed6ed365623b-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=G8qmEpQ66gE8tk6cXVsBlD9+MFs/Iqrcf7Wuf1YPEUg=;
	b=NKbPBAzA+ZEV0potbm3IXxO9Fq25rG8/MoZ4Q2Lw3u3lzW7CrQKWiWFvCJsOo3DwVNkddaokunoyclSS/TG3MiCS8q3clLXXCK/hOSdL2H6SoNhkjqkaafi6+hZHH+wleHXksSNHPGZR6vZyiEqZZTCT7921WCnrC0P/ez4JG2c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:a1752f67-5011-4911-bb07-1f66eedfacce,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:25ebd5cc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d4bfa694927f11ef9048ed6ed365623b-20241024
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 142701101; Thu, 24 Oct 2024 20:18:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 25 Oct 2024 11:18:37 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 25 Oct 2024 11:18:37 +0800
From: YR Yang <yr.yang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>, YR Yang
	<yr.yang@mediatek.corp-partner.google.com>
Subject: [PATCH] mediatek: Add sof-tolg for mt8195
Date: Fri, 25 Oct 2024 11:12:42 +0800
Message-ID: <20241025031848.21368-2-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241025031848.21368-1-yr.yang@mediatek.com>
References: <20241025031848.21368-1-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_201842_491348_FB3BED42 
X-CRM114-Status: UNSURE (   9.88  )
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

From: YR Yang <yr.yang@mediatek.corp-partner.google.com>

Add sof-mt8195-mt6359-max98390-rt5682.tplg

Signed-off-by: YR Yang <yr.yang@mediatek.corp-partner.google.com>
---
 .../sof-mt8195-mt6359-max98390-rt5682.tplg      | Bin 0 -> 16191 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg

diff --git a/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg b/mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
new file mode 100644
index 0000000000000000000000000000000000000000..427d6c62387b53f8ac898a86b506e8c0cb4362a7
GIT binary patch
literal 16191
zcmeHO&1(}u6pz+w(N^lmNqX2rz=IIFNk73u)1-xBYy&knp+qefth6*Oq_-X_2p+7W
zAby-g@aSC+A_#udqem}7|BL$jxwCPS?(WQ{N!qRR;O(32zS(*6oB8Esb~BlU>2!O{
zkq(%+D3^pi1iL88-LUjIB2=7isA<F9+InIcDJ+KPhV=y384^QShn|4uGnegwJPI0;
zFP2Knb4v>=H|MPUd~x+!@%k;x9`LNW4e`7nPG(^(QD#h!ap>%Raj$&)etP5OudVjY
zI~N!?V`aBCaQ!gs13E(<3Cn&E+R?(eo#^G2#)_&RJ!p=~I2qp!=o(_1g)KrEUl%kz
zKGvI<DqKNPDe#?{o*JLY=8{TZReV2j2TR<AkP+weU2i_T+s>z7or_;x{rLNm9RD-n
z`&`&KEc@n;0Z(%b*jIN9E~3nPQ=dW+KaP4L*L{c^l<a|dVy7d-_7pTfksr%VOpYb&
zgc4?@gVeAJThfN{6Q85dPtYv@^%<7()iJSe!hVM(MnA;ov#_kob6=o$&%^?`OU&ud
ze!JWq+!c2Rai^W4>US1ZEK!ZIH-Njzea>AwJa<z9A%CO7xgPFvJR-^6B)J<5v(iC=
zT7_+^xy$cQm%E)PGw%*%q<{m8a^B4p7nfI-W-WWjyMn6U^>CLh)qdymJE$9qyqnrD
z++~uI^X^H+hdGl>OiZGr7Wn?nyM<hz(piObJ>2E@JGn~^$Dy1roHu^IedOG^r+GI;
z?gqoGbU;5{QDN)F-OXdo%ex#0>N?cr?(lB7JM8wf+N%1Ug}WuH=;mFz2XMD<pK~`A
zp1b`5A%CO7xgPG4r;+4tAGsS0v(iC=T7_-1xr?uX%6fN%2>?RwZeW0P*Ho+{eEpWU
zbg2mQAeEdnVi0H)0&}>L{M%3U%!TvZm9@9A7?r;%T;&{nPlpj6I9vB_#{T1@dY!~*
z9X_Tk+k44Mmx}P20Cn$rR|&-w4iEzVeDt1_QRJh}+J{3*KEl^`9V!p|X?&nk3@05N
z%rQC$)bd{S45kshck^Q*r(VwxNr#X9mhH2)l+ngx<`|V?_~_tZj?qEDmybSkzY%<t
z->Du4RB-{<T8~p;8)d!(f?&O@{r=9WVU7lY)*w)BO*5tygMdMx2?*5wUVDu;n1Yyp
z_?%}1If&1F(y;t2zatvOxiJ5)kn4thza;;+!TnFk&ittN><8U2Vi0Hv0wzDU1ZLBS
zL7*uJL^VG$?%MpQ`z*F8K$@Ex1UwKh`OyOubIKqP5d@-|AGwy@nIHAujYMQ<Oqd4%
z0h1pOz#y6~{I>{1H9zwI$MQQ$J`Z-^QFfqH>=$!rv-U}b*++`^quP5R5wf;~>01z1
z#7SV)lznN$N_XELunOK3rHxLtBe2r$TM$;9cf=~pex~Y3f<J}XUlhhSxYg>b7=z%=
mEs}c>R_;3*Vx_x(M7p)Ii2iHu=LqAgY*=ytR>7MIB;P-JU)df2

literal 0
HcmV?d00001

-- 
2.46.0


