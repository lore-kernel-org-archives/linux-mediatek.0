Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B8BC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 18:01:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E43ED206E9
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 18:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rt6jOW9g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrDAKLp+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E43ED206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=emK/PluO2Z63mYpO/i7HJ3n/lXYBxsZfWogpFjH7aYQ=; b=rt6jOW9ghJdy8lNWVVFis2ByZ
	OmL4C6I0pRpc8CJgcU+jRgNJAkeTMXYSQZ0KMZ4MvG4yBUuyb0qXl6DtoLoRO8ZFDWpsP77K7VdL6
	0YfJR1Jdp6te/ivlLRGMLDHkiq9BVyCJBKWVaX2mR9yZ76dppiszetHEYurD+pAJnUC3uS8rVDyBO
	N7G//cfuadlGm3T2n8bi97OGdfKqcPXlRs9d1RvLajJ48YS8KM7B7hygrGEVKwVkutpM2aJRdQ+0l
	cVns041HsqVVzPy05JJKIftXF2H9er1IJegl+D+uEnkz8KMcWAgVrtOR2oyuEQDAunuQd8nqXzThI
	x66WFfUxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4T9t-0007at-9i; Sat, 08 Aug 2020 18:01:29 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4T9q-0007aO-U3
 for linux-mediatek@lists.infradead.org; Sat, 08 Aug 2020 18:01:27 +0000
Received: by mail-ed1-x541.google.com with SMTP id v22so3541021edy.0
 for <linux-mediatek@lists.infradead.org>; Sat, 08 Aug 2020 11:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wNMGWRpxLCRNhvFBGn2jHdGfSMLwsC5v0n8Wvl9tloI=;
 b=RrDAKLp+DIWJDyBxuL7EGjOl+uvuEsQWiMmxUldIQgundkg4I5B+fJZqXWuFx1vMnE
 pGVgzvDoVkSAMQbP7EjI/F3/LUYCucJecIctDzjrUp1n9/R+VfYTI2JS0QkiRDYQOF4Z
 DvM6XxjspJ+Ff2KVkWQTDpGIaMdlspoiKIuCCuRkWxDbgrkWLMy4FRvrDIbmocZj4aao
 LnARnBq7PpbwacoH6MRpzJ/o6Ny1JRIJ1hBmPBh5jCyuaH4iz87VK/hWMo1flcQec+z+
 MEf8hrDrO+GsKiYxtexufv5iIz5CuLQEVdukZdjPrIi1MY8tbeJySfoN/6gPb7DlJmDH
 N+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wNMGWRpxLCRNhvFBGn2jHdGfSMLwsC5v0n8Wvl9tloI=;
 b=KIJkLFepT4TkJZaGhTWPWYhlLftjn2+DKRSBrELpJCH7ADuwsZxXgaKjb41XhMPJoO
 da4Asv1qsFPgT97KoNSptBcAcp+CCVVIKcYka2xqiGEahi+xYeE92Qb48mAXm8aZAH8A
 TpzZy4vhvuRUh6rOIQ0YjxSExjqyQWmyosQAvulGaJipILJL1ucLS+hF5vo2TEAKWpNW
 OYuPUdNoitec8m/+JrpuPMbSEWrkg8CJSGFCLULVM29DoIR8oTFkCJQ1/nh0Cos+qZ85
 pyanhUlPTtg3zEzWwKc8kVEF/KikI8/hDRwdBbUq4xjBGJfJxALVG1YCkN1c+BZKbjDp
 HO+Q==
X-Gm-Message-State: AOAM532soUxjoBGlVmbT3VGyPtdXUNL/zD+shJQyeP49dD5evdzjUReC
 7tgcD7rgTIYukB4eqk9srPVJ+Cnlgdj8JAnNKWjKyw==
X-Google-Smtp-Source: ABdhPJwO+qAYZzfY4DVdu4jrtJuqEQEAgJDBQPgUcmUAsW8uqauCkwC2Ac8pWaKoqOLRGUTaLHz6kTE1GQvFWurJiiY=
X-Received: by 2002:a05:6402:6cc:: with SMTP id
 n12mr14807902edy.258.1596909683186; 
 Sat, 08 Aug 2020 11:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200804104535.GA398141@mwanda>
In-Reply-To: <20200804104535.GA398141@mwanda>
From: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Date: Sat, 8 Aug 2020 20:01:16 +0200
Message-ID: <CAA2SeNKdO6bq5yp4k3q6phJmTDnU5oL5vbJ_mFY78uKMz4CFgQ@mail.gmail.com>
Subject: Re: [bug report] mt76: mt7615: wake device before accessing regmap in
 debugfs
To: Dan Carpenter <dan.carpenter@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_140127_011104_E141386A 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>
> Hello Lorenzo Bianconi,
>
> The patch ea4906c4be49: "mt76: mt7615: wake device before accessing
> regmap in debugfs" from Jul 3, 2020, leads to the following static
> checker warning:

Hi Dan,

thx for the report. I will post a fix soon.

Regards,
Lorenzo

>
>         drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c:179 mt7615_reset_test_set()
>         warn: inconsistent returns 'dev->mt76.mutex'.
>
> drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
>    159  static int
>    160  mt7615_reset_test_set(void *data, u64 val)
>    161  {
>    162          struct mt7615_dev *dev = data;
>    163          struct sk_buff *skb;
>    164
>    165          if (!mt7615_wait_for_mcu_init(dev))
>    166                  return 0;
>    167
>    168          mt7615_mutex_acquire(dev);
>    169
>    170          skb = alloc_skb(1, GFP_KERNEL);
>    171          if (!skb)
>    172                  return -ENOMEM;
>                         ^^^^^^^^^^^^^^
> This is returning with the mutex held.  What is the mutex protecting?
> We could move the allocation and the skb_put() before the
> mt7615_mutex_acquire().
>
>    173
>    174          skb_put(skb, 1);
>    175          mt76_tx_queue_skb_raw(dev, 0, skb, 0);
>    176
>    177          mt7615_mutex_release(dev);
>    178
>    179          return 0;
>    180  }
>
> regards,
> dan carpenter



-- 
UNIX is Sexy: who | grep -i blonde | talk; cd ~; wine; talk; touch;
unzip; touch; strip; gasp; finger; gasp; mount; fsck; more; yes; gasp;
umount; make clean; sleep

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
