Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76C5D10DCF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=; b=rWTekoAmGff0EcU46Pn3mT9I7A
	r6UqEW5gIc+Bz2M1CukdgIvMmhcg8ZLR/1Opr1SwKEs/4jYlL3p7yn/e2X7101feSnkokL63z+yD+
	UjbNEseJDHa0P/td6G2nv1n3HKsNI4T07O/KFNSGUrdjRL3j/5bHBC8cZ1sLfY7OwA9fS/mHSOzrl
	dokME2DhbUFh9IBA7qKVMIkjnILmA1ar75zVRmq3UMdRS5+0KRavKa9JLOph8wxpNTMznrrEwOTxs
	PfXVj79cB8/mtJ++/APz+IxBPDvtkIBnXR2v7ThRvBJVLiwbsJNVR9mg+unFFk0jpu+7pQQVpsrPB
	jdtsX+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2tc-00000005b9B-3Vlg;
	Mon, 02 Dec 2024 09:39:12 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2sb-00000005au4-30TE
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 09:38:11 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-71d5984e56fso1809069a34.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 01:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733132288; x=1733737088; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=;
        b=zwFcXMH3lYwgwu7U196tcIxt2GBsKjeAFh3GtHAsBE/KMyJWjsEGMyVn8GR1DH40rA
         tIMG7lLp5Ml57iqbJGkTn3XmZItWtcVuS8KkSq+O0CeRGQl0ll9wCFUJ5o3LnEbwpRaM
         noP/6s9YjLVEyJbSX7NO7kVVgux4fkswc06epou/glotxpx34sUih6jEnbDneCD81rEz
         hJkY7cN/Ke/E3CiH3vX6g0sPnzPbj+PQIy0+M7hDpYqmP8UStcul3xMu8jWSlkENUR98
         UbBan02XVXep8amhsASLnL62rmWKowQMi0tGbSPhM2sGrC1DwnFDIvqZ75mPIGj5QaA2
         bkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132288; x=1733737088;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=;
        b=T0LoVYtXZ28bagWKOz0LdWfdWfP5RJMsoTi9+GsXU6+4FFLA2rHISLOk5mUaWcVCBS
         skP5Nldnd2NOae+f5zuS9joA4yjrAJdFoYJd+T/8iTbY6UlSm7gBt+m8olbzU6pTM2f3
         a6CjUX0jknMFlzalFDkXRNeFt2lH5P7Hp2tN4tyJGZorI1IWujVUs93uHAr86TMmpxge
         aG62jRfypZVEHyHaoBur+HvLVUfUp78TdECgAJmwufcqZGUjKpl3wgzMUTj5pCJ6GNqu
         0dhPYx5vixKR0JWrplKz3ZPqkXpJhe/lgFf/SpVrKjQDMdgMCis1wmU0t2YGVK3ZIXvv
         snEg==
X-Forwarded-Encrypted: i=1; AJvYcCXUZ/bBr4ujolLzlAX3pLwStOD1vPsi4AUGEAogxUXA4pRB0TSZAZg+PAXiHtGh3rDl9osLUQSMveGFhAkocg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoapzGwQQ8/77BPif2zAldSC5d59L5D2evGYwxSE0dzbq91Zoo
	X4pr6288uz8OZp7w2u80IY7wCxQJ4Dhuo6RvHQktRvgcGlxVW3xpyiyV4+xooq69PYCxDmJ3iDq
	v9urd5oNlhpfXEB1NV43iHiowjnhDY6fBb6Cgvw==
X-Gm-Gg: ASbGncsC8QZahYtO1HRX9qC+kK7nYSI7ivcN+T8SarojHBDjviD0LHmGlu5YjdpQPw6
	ezs3uI2CiUHD/SRQlx9gY864kjhKGUg==
X-Google-Smtp-Source: AGHT+IGFYBkRu+t9Rgm8uEYvRACv3R8GZFuyUPEoCQ2kFsszRxvWlytkFAb4tTArftXgRYmzaFXCGr9/hwxPw8QMZIA=
X-Received: by 2002:a05:6830:6d84:b0:71d:559d:de29 with SMTP id
 46e09a7af769-71d65cce8femr13291782a34.17.1733132288329; Mon, 02 Dec 2024
 01:38:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Dec 2024 03:38:07 -0600
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.8.9
References: <20241128030940.25657-1-liankun.yang@mediatek.com>
In-Reply-To: <20241128030940.25657-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Date: Mon, 2 Dec 2024 03:38:07 -0600
Message-ID: <CABnWg9tDMkKkFbQpL8YphOBu3_2zr_q4YASnO-UYMrdM22wCuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Add return value check when reading DPCD
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ck.hu@mediatek.com, dmitry.osipenko@collabora.com, rex-bc.chen@mediatek.com, 
	jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_013809_756551_26685394 
X-CRM114-Status: UNSURE (   9.93  )
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

On Thu, 28 Nov 2024 04:08, Liankun Yang <liankun.yang@mediatek.com> wrote:
>Returns the number of bytes transferred (1) on success.
>Check the return value to confirm that AUX communication is successful.
>
>Fixes: d9e6ea02fc3f ("drm/mediatek: dp: Add MT8195 External DisplayPort support")
>
>Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
>---
>Changes in V2:
>- Modify Fixes in Commit Message.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index 1cc916b16471..9dc68ec2ff43 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2101,6 +2101,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	enum drm_connector_status ret = connector_status_disconnected;
> 	bool enabled = mtk_dp->enabled;
> 	u8 sink_count = 0;
>+	size_t value;
>
> 	if (!mtk_dp->train_info.cable_plugged_in)
> 		return ret;
>@@ -2115,7 +2116,12 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	 * function, we just need to check the HPD connection to check
> 	 * whether we connect to a sink device.
> 	 */
>-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>+	value = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>+	if (value < 0) {
>+		drm_err(mtk_dp->drm_dev, "Failed to read DP Sink Count: %zd\n", value);
>+		return ret;
>+	}
>+
> 	if (DP_GET_SINK_COUNT(sink_count))
> 		ret = connector_status_connected;

Hi Liankun,

thx for your fix.
I think your patch could be improved by using the drm_dp_helper
function drm_dp_read_sink_count() ?

Thx,
Guillaume.

>
>--
>2.45.2

