Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5151CC55178
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:28:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F492151B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hgpfpxkt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kxAZv+0m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95F492151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XKWlbsPAZZSQHn0HE8rKrDoO89O6ggsZh+W6byhtjMg=; b=hgpfpxkt8cC62/eiPGUWA75nV
	eRcrrO1056t7A4jmv8CPoQqVf8F6gzxopIvGRqVCiQ6to2LRTQuMlvfsMpHqHj4a9bl1FPg1yl4FW
	aIy8n8XGYQ+PrLGQFObTOTYi0GqS+MSUavCGN2XHPTJKYmJVvMo/jd8aVUspUSOcv8i7PoL0O2231
	MYYtu5ku3fKBw//A8lBTuIE6tSz93oc5njks1N8i2C8d4AhXN0Ox1eBjAX7PZQhOTtitYp7no92ds
	C5oYa01rLkjse96Fdz7fLxVGFXnoR1GIMbVIxMctGpvjvgQ2zH8lKzzpDgH1dzfFLgFJAAWPtAQYM
	DeVWirBFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXCqt-0001vD-Jk; Tue, 27 Oct 2020 00:28:39 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXChn-00069N-4l
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 00:19:26 +0000
Received: by mail-vk1-xa42.google.com with SMTP id y10so2380841vkl.5
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 17:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ee37VVRPxs0S2etLXGh6xV8laF1VNOAKF+VF0HuUjkQ=;
 b=kxAZv+0mQcKYBuVdzin8rkjMnzfhLBDPX6S6+L07huFlcjxF8mKM/BPqx9iHEfNk8N
 ntE+tHKzTZ/v0k+wkRefnMk9W1Su0kxMrgtS9PxdFum2FD4H1iGLmB2hQndy5GFsSjyC
 nCtpYS7ntjfwashOGhDSvJtZt9yx0K2VTtHno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ee37VVRPxs0S2etLXGh6xV8laF1VNOAKF+VF0HuUjkQ=;
 b=b5QvtLFX51/eNqrz55gJxGK0UmMsKLd1dcsd1J/2pE2XbncT4Ps+t1RmFmKd+WYUFb
 zrGkFYQqjlBgT1wbDHO5M6bKKG5zbrePqFsAwXw7lG55QFZQXIrNpLZM/MU/ASkeq9YW
 wIA4MHJK3SVLiiaQn7i68hvB2d7qz2xy74NjbxLG1Vz8nBrHds/+ieNcevSMxxOP7axt
 GpH/XHQN45r13Er8IgqnFfg4gsn78DpdyDq7b5ybk+oXtC1WYMacFBWeb7/D1UlUB/gT
 P8AhKvg41Il7Ler9HLUJZaKg0/kCO+BEJ7J1Ap5TQ+GdInHZygdvo0np+3j8KOFMa/k1
 Si/w==
X-Gm-Message-State: AOAM533DpeczMi5tYXiPYyutJ9dZCEUmys7Af8HDWbWPgnuFXHJmzEbf
 vCR0jIA43VF2Y7gXiG06/giInEY2CplbNwKrSDZwqA==
X-Google-Smtp-Source: ABdhPJwEN10aQdM7CcIsGMKnEMqtd3YhNP4F1hLbo3BOr3kgS2UxLTXXi5WcIhIYa0t3Zw6dxKV2czwgy9AN9Kv6Ctg=
X-Received: by 2002:a1f:8d91:: with SMTP id p139mr230741vkd.9.1603757950953;
 Mon, 26 Oct 2020 17:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
 <20201001160154.3587848-3-enric.balletbo@collabora.com>
 <CANMq1KDSsfX3r1440qbmWggqbD7pU_iM4S36LUF8rsS2jVGqOg@mail.gmail.com>
 <ebba9def-e394-c183-dd80-6dc3716a7bd1@collabora.com>
In-Reply-To: <ebba9def-e394-c183-dd80-6dc3716a7bd1@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Oct 2020 08:19:00 +0800
Message-ID: <CANMq1KBfKK9-RfMK89hRCGzhqZVqs6+YRdw8o2K+jA+3VN1_gw@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] soc: mediatek: Add MediaTek SCPSYS power domains
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_201915_309038_09A7D489 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Enric,

On Mon, Oct 26, 2020 at 11:17 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Nicolas,
>
> Many thanks for looking at this.

Thanks to you ,-)

[snip]
> >> +       if (id >= scpsys->soc_data->num_domains) {
> >> +               dev_err_probe(scpsys->dev, -EINVAL, "%pOFn: invalid domain id %d\n", node, id);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       domain_data = &scpsys->soc_data->domains[id];
> >> +       if (!domain_data) {
> >
> > Is that even possible at all? I mean, even if
> > scpsys->soc_data->domains is NULL, as long as id != 0, this will no
> > happen.
> >
>
> I think could happen with a bad DT definition. I.e if for the definition of the
> MT8173 domains you use a wrong value for the reg property, a value that is not
> present in the SoC data. It is unlikely if you use the defines but could happen
> if you hardcore the value. We cannot check this with the DT json-schema.

I wasn't clear in my explanation, and looking further there is more
that looks wrong.

This expression &scpsys->soc_data->domains[id] is a pointer to element
"id" of the array domains. So if you convert to integer arithmetic,
it'll be something like `(long)scpsys->soc_data->domains +
(sizeof(struct generic_pm_domain *)) * id`. The only way this can be
NULL is if scpsys->soc_data->domains pointer is NULL, which, actually,
can't really happen as it's the 5th element of a struct scpsys
structure `(long)scpsys->soc_data + offset_of(domains, struct scpsys)
+ (sizeof(struct generic_pm_domain *)) * id`.

I think what you mean is either:
domain_data = &scpsys->soc_data->domains[id];
if (!*domain_data)
[but then domain_data type should be `struct generic_pm_domain **`?
Does your code compile with warnings enabled?]
or:
domain_data = scpsys->soc_data->domains[id];
if (!domain_data)
[then the test makes sense]

[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
