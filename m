Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFE2C8303C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 01:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TV1TFdaES918kkyGvC7VR2bzxava0AY06W5g62VEFas=; b=hx2h6tfY9kvIafUPYn51go48Lp
	/EIJ6EBaAiUkX6qfT5Mu2cqByCQ07CHj/lAnt001tPH36fs8oSTazXznZwJMjlg7w0ugOC7reXkcg
	+A+rMFozC8kyckgovdUIDC8WKsnIFAce8daa328kzeDgSJzJ31vinzMxERwnXM2z0LiBAHYi6Qqsw
	OhiDw6J0q/lpTIXUJVosnSLLWGq9djxs6EDiEOChdk3iIBAb3BQLxgQbw+qhwVwb1DghKOQ/0baoX
	2guLpespFQ4chRJp5+imfowMqcnM1JHdPsIo7m1fztTat52x9xLZw0mCXvn7StNmWP0SjVltQPl2T
	LdzBxINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX8wu-00000009wT5-1Ppo;
	Thu, 03 Jul 2025 01:41:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX8wr-00000009wSK-0hio
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Jul 2025 01:41:14 +0000
X-UUID: c99c569657ae11f09f706fa2197c6ceb-20250702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=TV1TFdaES918kkyGvC7VR2bzxava0AY06W5g62VEFas=;
	b=rm2EqQIv7Tu0mZb4a0GSBY5NstNEn94r0a/5mSghubLjrHbQufx/ySPQOAUYNHF0LUIH7VuNlTvj7qX3MqeKaF9gStuHUhj1VzIWE/pT40RIrn9jnscdAdvfAb5nWXzk8Yf6Muz/CDz/dX/OELd1hssmFnTrS0WvIwpmeZeA4Lw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:22d2b266-c2ea-4ac7-bba3-02009008104d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:610be45f-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c99c569657ae11f09f706fa2197c6ceb-20250702
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 78094734; Wed, 02 Jul 2025 18:41:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Jul 2025 09:41:03 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Thu, 3 Jul 2025 09:41:03 +0800
Message-ID: <54df1d3fe61bb861b97c897aaa4a2a3e08f71e62.camel@mediatek.com>
Subject: Re: [PATCH] wifi: mac80211: determine missing link_id in
 ieee80211_rx_for_interface() based on band
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless
	<linux-wireless@vger.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Evelyn Tsai =?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
	<Evelyn.Tsai@mediatek.com>, Money Wang
 =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=AE=89=29?= <Money.Wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>
Date: Thu, 3 Jul 2025 09:41:04 +0800
In-Reply-To: <6c666ab6d83ba45f9f15643eeffed5d0f4770867.camel@sipsolutions.net>
References: <20250702104403.2738634-1-michael-cy.lee@mediatek.com>
	 <6c666ab6d83ba45f9f15643eeffed5d0f4770867.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_184113_224483_D928FD29 
X-CRM114-Status: GOOD (  17.86  )
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

On Wed, 2025-07-02 at 12:52 +0200, Johannes Berg wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> On Wed, 2025-07-02 at 18:44 +0800, Michael-CY Lee wrote:
> > For broadcast frames, every interface might have to process it and
> > therefore the link_id cannot be determined in the driver.
> >=20
> > When the frame is about to be forwarded to each interface, we can
> > use the member "band" in struct ieee80211_rx_status to determine
> > the
> > "link_id" for each interface.
>=20
> Hm. Qualcomm has a similar thing with frequency, I think, and that
> probably makes more sense for them since 'band' isn't unique for the
> radio:
>=20
> https://lore.kernel.org/linux-wireless/20250612121127.1960948-3-maharaja.=
kennadyrajan@oss.qualcomm.com/
>=20
> Or is it not related?
>=20
> johannes

Hi Johannes,

I think they're related but address different issues about group-
addressed frames.

The Qualcomm patch seems to focus on preventing frames from getting
processed on an interface running on a different band. (referred from
their commit message)
For example, a frame from frequency 6135 MHz should not be processed by
an interface that does not have a link on frequency 6135 MHz.

On the other hand, the problem we encountered is that the interface is
going to process the frame, but the "status->link_valid" is unset
because the driver is incapable of determining the "link_id". The
"link_id" remains its default value of -1, and the frame is handled by
the interface's default link and is dropped because an AP MLD interface
is not using its default link (sdata->deflink).

In summary, the Qualcomm patch focuses on avoiding frames being
processed by unsuitable interfaces, while our patch aims to determine
the "link_id" so that the interface can correctly handle it.

Additionally, we also think the 'link_id' can be determined based on
'freq' rather than 'band'. What do you think?

Best,
Michael


