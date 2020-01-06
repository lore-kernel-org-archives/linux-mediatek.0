Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8439C00523
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 00:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4DF215A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 00:27:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3TWgU9l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="auZRD/w/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4DF215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yChF/5W6zWkPI4zVDo5wSEYwpWp6Gf0IF/yTinERm+E=; b=d3TWgU9lvYTxfO
	fVzvSmz34ROmfK/a5Mawre/M6tmcKt4oUciyOO+1UVVWqTNgJgao2VgCDKNORA5UYK3igoaBvOD5Z
	6EAlJ50wseH5/q8TTb59sOfg9k8JsTxZO/3VV2kcAMzgYdMJFx2asAmMF9p2hros5qVMZQtoWXUNC
	yw7XHJmQ2Wsfdxg+SZxDVMOhFfyiYfj51OlWYm1i+/dWVaJjWUn9Vh4zJgcKsc6iWlyT6PHtbGAEX
	5npW3/KgGwcDFkFPMJnhiXLU7Kgz4Hn2hfT/8+VW07c3MNgn3s4O3HnNLQT1USTOUwgX8kFRDUfGi
	tdHSxkJap9neYLN0U4Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioGEc-0000t9-UK; Mon, 06 Jan 2020 00:27:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioGEX-0000or-3U; Mon, 06 Jan 2020 00:27:02 +0000
X-UUID: a7b8e976295b4cfbb7ba3839b322c245-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RtocooZxOutpJvHIz7Z7EHFeutv+3ZeQQ4M/OYfYdXE=; 
 b=auZRD/w/39O2uVOF7o2uui3Cse7Pz9s++GKusvTX7OdB+3tkVLYaYKghD8bzeR0dCf3mmRRADiMJzlUXfsrf/mnCah7a8pNwpEMMC6L8WxwNnTE8qPlgkyIiKT+TMVbhfaqjgljoRmIdBFjyta9opQGL1D3i5XaoN3WVXY/IPh8=;
X-UUID: a7b8e976295b4cfbb7ba3839b322c245-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1258569361; Sun, 05 Jan 2020 16:26:50 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 16:26:49 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 08:25:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 08:25:07 +0800
Message-ID: <1578270395.17435.4.camel@mtkswgap22>
Subject: RE: [PATCH v1 0/3] scsi: ufs: pass device information to
 apply_dev_quirks
From: Stanley Chu <stanley.chu@mediatek.com>
To: Avri Altman <Avri.Altman@wdc.com>
Date: Mon, 6 Jan 2020 08:26:35 +0800
In-Reply-To: <MN2PR04MB699151E6AEC7D15CBE1224A2FC3D0@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1578200118-29547-1-git-send-email-stanley.chu@mediatek.com>
 <MN2PR04MB69913F0B671032A388747CF7FC3D0@MN2PR04MB6991.namprd04.prod.outlook.com>
 <1578229802.17435.3.camel@mtkswgap22>
 <MN2PR04MB699151E6AEC7D15CBE1224A2FC3D0@MN2PR04MB6991.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_162701_153989_34EED914 
X-CRM114-Status: GOOD (  11.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Avri,

On Sun, 2020-01-05 at 16:40 +0000, Avri Altman wrote:
> > Hi Avri,
> > 
> > On Sun, 2020-01-05 at 05:51 +0000, Avri Altman wrote:
> > > You have to squash patch 1 & 2, otherwise your patch 1 won't compile.
> > > Other than that: looks good to me.
> > > Thanks,
> > > Avri
> > 
> > Sorry because I sent 2 series in these two days.
> > 
> > Would you mean patch 1 is series: "scsi: ufs: fix error history and complete
> > device reset history" and patch 2 is series "scsi: ufs: pass device information to
> > apply_dev_quirks"?
> > 
> > Or patch 1 & 2 mean the first 2 commits in this series: "scsi: ufs: pass device
> > information to apply_dev_quirks"?
> This one.

OK! I will send the updated v2.

> 
> > 
> > Thanks a lot.
> > Stanley

Thanks,
Stanley
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
