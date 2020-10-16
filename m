Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB68C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 23:14:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1509020878
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 23:14:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ECBAgFyW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BfeX+e7d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1509020878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jDNGO8OrjAymJQmh7lReoNltvTAFvqlqkbTPBGUTYho=; b=ECBAgFyWHYVmcHU14WrF/4zOQ
	0r/YOSxUmNf1Y3FLiV1cjCL3Dn3apwYk8N1HmjKwgNS4lma8XLYI+55DOKh/TU2ZIQK9szIaX0OET
	X2yEAE81l2w5gdrYkJgVVXHuI1xDae4J7Wt9YmXKL5w98QQED4hDDbqjMaPPVMtctqyGghFETrm10
	+hnjjwCpwqK1YG1Qsco5+iQR228Bi5SFOKTFIyJCtCLD08hEMik7OMrPe5HEw49iolicglgDcZMKj
	UgPhGlsqKHLACCnCA27sERYPGvcOVxvcTnLp1cy57qdkdY5cDV/TGrUy026ZwAc/qbnOgoXHxagJB
	Z93bRQgbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTYvv-0008DB-GC; Fri, 16 Oct 2020 23:14:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTYvr-0008CK-2E
 for linux-mediatek@lists.infradead.org; Fri, 16 Oct 2020 23:14:45 +0000
X-UUID: d53a05ae6217470f8571b7e721431b9a-20201016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EuZKtFefiJ6L/4gR71BklH0YKnd9Ub+bhASYlt1eN4g=; 
 b=BfeX+e7dOHnd7KHlmPGHsSt/Mj5nEh+4kCitBL3kHsqINytArf3VUkuMYXv3Q1rMIUETbmGLYZLh8V7F7BD5GWK0VdknkJmK0zP/x5c33pWQYWDe/GpcPJhrVyEgKsffyg8vvM7tBFER3lhZdebazHTlsApxDyvSp9Wjede5V6E=;
X-UUID: d53a05ae6217470f8571b7e721431b9a-20201016
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1503515879; Fri, 16 Oct 2020 15:14:36 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Oct 2020 16:14:34 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Oct 2020 07:14:20 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Oct 2020 07:14:20 +0800
Message-ID: <1602890061.23114.2.camel@mtkswgap22>
Subject: Re: [PATCH 1/2] mt76: mt7663: handle failure event for patch
 semaphore cmd
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>
Date: Sat, 17 Oct 2020 07:14:21 +0800
In-Reply-To: <267346a9a9c5f71caec03292b6c33b39864b38c5.1602807276.git.objelf@gmail.com>
References: <267346a9a9c5f71caec03292b6c33b39864b38c5.1602807276.git.objelf@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_191443_234135_11DF7A66 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: Sean Wang <objelf@gmail.com>, linux-wireless@vger.kernel.org,
 YN Chen <YN.Chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-16 at 08:26 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <objelf@gmail.com>
> 
> Just follow up vendor driver to retry a few times obtaining patch
> semaphore when the event is PATCH_NOT_DL_SEM_FAIL. That usually
> happens in Bluetooth and Wifi driver contends to download patch
> simultaneously.
> 
> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by:  Sean Wang <sean.wang@mediatek.com>

What's the difference between this and https://github.com/nbd168/wireless/commit/f55bc2f37e247729f8087434b9aafc4d0095c4ca ?

> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> index 2b17bd1c2a32..c990ccd6f472 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -1945,14 +1945,21 @@ static int mt7615_load_patch(struct mt7615_dev *dev, u32 addr, const char *name)
>  {
>  	const struct mt7615_patch_hdr *hdr;
>  	const struct firmware *fw = NULL;
> -	int len, ret, sem;
> +	int len, ret, sem, c = 50;
>  
> +retry:
>  	sem = mt7615_mcu_patch_sem_ctrl(dev, 1);
>  	switch (sem) {
>  	case PATCH_IS_DL:
>  		return 0;
>  	case PATCH_NOT_DL_SEM_SUCCESS:
>  		break;
> +	case PATCH_NOT_DL_SEM_FAIL:
> +		if (is_mt7663(&dev->mt76) && c--) {
> +			msleep(100);
> +			goto retry;
> +		}
> +		fallthrough;
>  	default:
>  		dev_err(dev->mt76.dev, "Failed to get patch semaphore\n");
>  		return -EAGAIN;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
