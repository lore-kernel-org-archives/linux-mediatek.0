Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5412FC369A7
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rO5hSAePVg69z8S7foOr3AdeQ+/5TGffHYa56Fdgwe0=; b=bUMBLz+ue0nX+l3/rfkZ2UlHCL
	7S3NgLRWPKtbkSXtliZ5FgWij7qvkcKQL5x1JWD+xFswglbowvN23kq6q3LEbv53YOo2quxUOcwyK
	TMrITWZWpCrSHrJikEoGKeHOQlSffOq1MTX5N8t6g1wDMGUsOZZ4S2Goe/deq8E12YAl5hEOIgHdH
	JzWFKh/75AynC6ISJcA6ynA7+r5jRKN9N4IpnRzQP+KYQRcTGjIHaLjuJ2kcBrUa8PhnesyIUeL8l
	ybFMOXdJbCoge0bB882LxJvVrtF39uwu2GOxgrsPNUQ4wOv8+neIat+D3j9R9pNCzBOc+kweM7BGt
	hIIq+SPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u248m-00000003DWn-0uhe;
	Tue, 08 Apr 2025 08:17:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2465-00000003D2d-2APR
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 08:14:22 +0000
X-UUID: 74824d14145111f083f2a1c9db70dae0-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rO5hSAePVg69z8S7foOr3AdeQ+/5TGffHYa56Fdgwe0=;
	b=MKHlG4esbJFlYGn/NEDinK/5Fkv0HsYjbrhwjh9TIc1A5fSctJnv+VLWEyfb3XAkdyyKuGHwgqzxZeENhwynq0b27GFtqU0qSO1YMi6MDlzA4izsa5rxVjZFI2mRmezJLaxCc+zB4WmgeTI2BdvhCtaOqK4PMf5H2BGi+jNdCgo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3c7d6129-13b4-4b55-a6e5-1ef18dc9904d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:19fed0a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 74824d14145111f083f2a1c9db70dae0-20250408
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <zoran.zhan@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1511475520; Tue, 08 Apr 2025 01:14:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 16:14:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 16:14:11 +0800
From: Zoran Zhan <zoran.zhan@mediatek.com>
To: linux-firmware <linux-firmware@kernel.org>
CC: linux-mediatek <linux-mediatek@lists.infradead.org>, <shawnku@google.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>
Subject: [PATCH 2/2] mediatek: Add new mt8195 SOF firmware
Date: Tue, 8 Apr 2025 16:12:36 +0800
Message-ID: <20250408081404.302196-3-zoran.zhan@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408081404.302196-1-zoran.zhan@mediatek.com>
References: <20250408081404.302196-1-zoran.zhan@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_011417_574500_846FD8E2 
X-CRM114-Status: GOOD (  12.52  )
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

SOF version: mt8195/v2.8-505268c
Release version: v2.8
The firmware name has been changed from "sof-mt8195-mt6359-rt1019-
rt5682.tplg" to "sof-mt8195.tplg" to be applicable to the MediaTek
Genio-1200 EVK.

Signed-off-by: Zoran Zhan <zoran.zhan@mediatek.com>
---
 WHENCE                            |   3 +++
 mediatek/sof-tplg/sof-mt8195.tplg | Bin 0 -> 16191 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 mediatek/sof-tplg/sof-mt8195.tplg

diff --git a/WHENCE b/WHENCE
index 2cc72d38..54ee5522 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8126,6 +8126,9 @@ File: mediatek/sof/sof-mt8188.ldc
 File: mediatek/sof-tplg/sof-mt8188.tplg
 Version: v2.8
 
+File: mediatek/sof-tplg/sof-mt8195.tplg
+Version: v2.8
+
 Licence: Redistributable. See LICENCE.mediatek for details.
 
 --------------------------------------------------------------------------
diff --git a/mediatek/sof-tplg/sof-mt8195.tplg b/mediatek/sof-tplg/sof-mt8195.tplg
new file mode 100644
index 0000000000000000000000000000000000000000..d1c6aed47c0d73240041f8aead317403553a7ae2
GIT binary patch
literal 16191
zcmeHO&1(}u6pz+w(N^lmNh<6i;6Vu8q@UoSY0^S5wt<?PP@)zKt+X^Pw6`8A2p+7W
zAby-g@aSC+A_#udqem}7|BL$jxwCPS?(WQ{N!qRR;O(32zS(*6oB8Esb~Bmz$#iSX
zkv5pPD3^pi1iK*0ov`#dB2=8Nt7*aATF%EZQdkVn4eJT6GbDzv4m|<QXRg?Nc@#7x
zUo4fDW)|m{Z_QZwx#H^e;*D9$?(?j<4e`7nPG(^(QD#h!acJ*+ac|}J{q)AmUt6u4
zcP=t+#>#GO;QC?M2Xux!5|;fSw8Mo_JJHQ6^%Ye=y3ibzaWcM}&^5$14O@gVz7A-5
zbfh~mQMihtQs6r^IWanw%_Wt-s`!554wkqJAtTNgI^KMEx1CSFIv2mT`tkQ=IsRwD
z_qnifSoX~w1D@s>u&?eITtb=mrapxtejN2guKN%-DA|2;#7;+u?I~z}EI*PP8y`v7
z2_?)*2dQBdwxkW?Cq74^pP*X+>N70mt7Br{g#8XnjDCpEXJJ{F=e|Jio{0r=mzdL^
z{dT$Azbo$c<4!w8)$c5-SfUzZuLF0J`<%OWc<!bILjFdDb1mHEctn!BNpd$BW~GA!
zwF=v2bC=(rE_d5eX5JmhNC5{F<-D6IE-WoCPFwbXcLi0yYvC?is{YRBcTgu3c{jCR
zxXUCZ=iQTt4|67&7#l}PE%5!DcMG{5rLzj>TDZ&acXF2;jzc+LIB)!Z`^dR-PxEey
z+zp0V>41K^qQcgTyPL-vmv=c1)OD!K-ND^(chK!=rB(Gi3wKLY(apPb58!UkKId*K
zJa>BqLjFdDb1mE@Pb10Q9&$GrW~GA!wF=uta~EF&<@N3m699zV-M|3puBli@`1&nx
z=~5QvK`J?E#2`>F1ZHp}`M00ynG5H+D{F6KF)DvkxXL;Do(@AiaJKH<jQz()^*V{s
zI($r7w)c{iE@j~}0qWlMt{jRf93TYz`RF|<qsT{{wGW4se1xy>I#eF^)A&H87*0Ak
zm}7JhsOG)u8B9HR@8-usPQ9KXk`5nxE!$^pDWi?Y%rPp(@X^7+9HWDPFCTs8em(do
zzf(O9sNw>ywJxW?Hdgo&2!i#p_WL`hhB+DpnuEYfbDA-&7z7Lg4M3p!_u6Z;!4$;&
z!{<Ch$U%JWlZNGI`5n<P&V~7Zg<Lo6`z86m4eozRcIHRDXFuqM5raTe5HR_%DKMKx
z3<3>7AgcM1aaZR@-Dj~40n*&mAmD+3$&VhOm{SIUh#(Nv{K&QJ&ittNZX_Z@W5PTD
z2$=kM00z-?;lD*7s`-)sKbGH7@_DfPj<OA%V!xO}8?{d|%sx`QAJyIqiIBA=Oy7dA
zB2EIUhU`ltR=WH4fK~9OC~b5q9f6g0--58>ydzd&_A^yR68tI5{-Q9x!L3$a#TW!{
nZjs!BuyWtg5G&pNBhsyvMf6{LKSvl}Wy6vKunOKxAo>0Qxe3`H

literal 0
HcmV?d00001

-- 
2.45.2


