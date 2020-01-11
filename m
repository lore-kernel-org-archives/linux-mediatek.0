Return-Path: <SRS0=lRAH=3A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0728BC33C9E
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jan 2020 07:17:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF662206DA
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jan 2020 07:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3KH2kgZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZVBa5wrB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF662206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1x58km5jALFn5Dj2WyrnqBzbRHuCSiCMgFlxBO6j4oo=; b=i3KH2kgZvMpFh5
	+pyt9tOvyVVTA1ZLV5INcsX1DBT0bsGGPSrea1yfKTiWzn75zyGcw0KOPI2T4aIv81Da7a2rCK1QN
	5m8Fw5VKmc1EAxeXKNoZlQ1VozR9+1aqfNK/MpkE7jVySvz/RwO+plgqGUx2atVr11U2nIaeaJWzZ
	GuawPP+KqOgIHGcqyp/2Gr6zIkWSxeiaY1sSBvcRdgTxLLv6XIy59Unls3gqtClZC8uUY2s2HSCxE
	j2G9RIcCjeqWOal2GR/43P+K1l4LFwnpl8z0BDt7cRHl1FamgPYApD1CWnNHf4+NJPhxY8N0zcFkN
	qvgy4DPM197zB0/FD5hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqB1o-0005qJ-8E; Sat, 11 Jan 2020 07:17:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqB1c-0005fw-Jt; Sat, 11 Jan 2020 07:17:37 +0000
X-UUID: 02f300f8cd1d41a28ead8cf8c50a2012-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=k/r+E+rZ5TVzR0eoZZhVyF7N7msarS1XBPeVmbXXWk4=; 
 b=ZVBa5wrB4rvX+2AEe5YsQqcasDmFRy0Cmbk0jkZdfRkeAdUBlAj+Z3U2n1wNiNX3s5SLP3+Ngb5FXXMulIqDqm3SNm+9RTu8R1GLB7BNvc7UkN4dWadBhnLJTRHNR8NgjeZr+XXVu7laUKuPOFFaz/+cQuJow+Fso+diSDgm++o=;
X-UUID: 02f300f8cd1d41a28ead8cf8c50a2012-20200110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1884920828; Fri, 10 Jan 2020 23:17:32 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 23:18:10 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 11 Jan 2020 15:16:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 11 Jan 2020 15:18:03 +0800
Message-ID: <1578727042.17435.8.camel@mtkswgap22>
Subject: Re: [PATCH v1 0/3] scsi: ufs: fix error history and complete device
 reset history
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>
Date: Sat, 11 Jan 2020 15:17:22 +0800
In-Reply-To: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
References: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BE6CDD5CE9F68F62515C03A4103563C2B33C58080B14D1E2DA17F98058B84D642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200110_231736_659290_F5D679DC 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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
Cc: bvanassche@acm.org, martin.petersen@oracle.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Gentle ping for this set.

On Sat, 2020-01-04 at 22:26 +0800, Stanley Chu wrote:
> Hi,
> 
> This series targets on UFS error history fixes and feature add-on,
> 
> 1. Fix empty check logic while outputing error history.
> 2. Add device reset history events for vendor's implementations.
> 3. Remove dummy word in output format.
> 
> Stanley Chu (3):
>   scsi: ufs: fix empty check of error history
>   scsi: ufs: add device reset history for vendor implementations
>   scsi: ufs: remove "errors" word in ufshcd_print_err_hist()
> 
>  drivers/scsi/ufs/ufshcd.c | 9 +++++----
>  drivers/scsi/ufs/ufshcd.h | 6 +++++-
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
