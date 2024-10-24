Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95857D0BB5C
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 03:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jv0rZFPivUTqf+eF/MatLHclmv8hrafr6wuKixn8vqA=; b=r1jMrNW/U2ebnHrJO6f5oZ6mft
	KbgT1X79Gi2TLmfVQQGVSmqioGhYHPRqYJjLspdPpafTPqnR0nbPyoON3x6Z0HbEPe2/drAveMD6v
	kI5Ln8G9amZx1FkEkhYGOCFbbgmRmEt6uPCORjcD3+IJOChobEKowg+OLPBryj4fmX9+sKEDs6jFq
	QM+Zyb4OcDchxuK/k4GJHMWrnRnM8ZiP0/MUmVnbwQZYpb8ubr+mDKHp8FRnY/e1Eeol9nnKztjXp
	PgYG2Jm+FNaAtpDght2wm1BLPPIv+EKpkvpaOvvOKTPkD8OD8M/Bpl3FTgysL3NNd6zk/Ew3/VecQ
	fbF4lmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3onQ-0000000Ge2I-19ke;
	Thu, 24 Oct 2024 03:46:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3onM-0000000Ge0s-1hZD
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 03:45:57 +0000
X-UUID: 76d2aaec91ba11ef9048ed6ed365623b-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Jv0rZFPivUTqf+eF/MatLHclmv8hrafr6wuKixn8vqA=;
	b=PqGzrJXDjXw7xV8sOTlAleD5Oz/iII6P1zh8YnQjxB5wMkLZBrw6wFOHYeE55gJqm6QFrvw16bzWWlPLt+BezDNAfCtQNc6j23zn4ZmfZla8jf25B/N2atNIkwBe0noHHNqasOuzN7SIvpuUkjSnQjErZpPtC+5IUCvuw8XMv0s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:746861d3-23d4-4a46-a45b-c03ed528c62e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:f277bf41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 76d2aaec91ba11ef9048ed6ed365623b-20241023
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 46465431; Wed, 23 Oct 2024 20:45:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 20:45:49 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 11:45:48 +0800
From: 20220315151852 created <yr.yang@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>, 20220315151852
 created <yr.yang@mediatek.com>
Subject: [PATCH] mediatek: Add sof-tolg for mt8195
Date: Thu, 24 Oct 2024 11:44:07 +0800
Message-ID: <20241024034558.667-2-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241024034558.667-1-yr.yang@mediatek.com>
References: <20241024034558.667-1-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_204556_542665_0BF0C609 
X-CRM114-Status: GOOD (  10.01  )
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

Add sof-mt8195-mt6359-max98390-rt5682.tplg

Signed-off-by: 20220315151852 created <yr.yang@mediatek.com>
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


