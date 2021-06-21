Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81202C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:45:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DEB96109F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 09:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DEB96109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLwcsO0+3SXNAPcKujzNq9gsMDyf8jdHIeU00veiVWg=; b=aWu5HFhcP3oqHM
	tmxA3ne0ZDGsAmdAwPiWH0AW7ziVTXXjG52Y+b2L2Vr/ekabnNsYYX/FomK04vADUWDNnc37JmNtE
	zwwbtD7CvvDsAA3qzrz0b07W56H6SU6k86U7XXPa6zJmIPcgq/To0FxQvlr5gwGrOPBd49GKm9cfY
	CGXwk1WumCn7jvVmIxX8VwD1U+0oLmuH+cWCLAMHCrcCjzBcCe/aFFypQf7UeCcBFeh8L/tlKyY4n
	d3lzIDAO7ubtdYwlclUS4+Lj4aKFM9aavNg04VhL9NNHNsTjUzvgzbPJptSYvLMQVeMtw9bYVME0G
	l/h7OKTuozB0WLwXWVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvGUA-002xwj-I7; Mon, 21 Jun 2021 09:44:54 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvGU6-002xuw-Sf
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 09:44:52 +0000
Received: by mail-io1-xd30.google.com with SMTP id h2so3234631iob.11
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1TJ7i7KgvD4fdVHGJRMyrwZBOAJHAbvbRMumj5+UHU=;
 b=oEH8oXFU370Br9g3znCrw/jxIio1QtFBa5A6CP3kUeuS19QSTY3vKt9nrCSZuKBVTi
 5brliEyrr6r8ljXgjJMpyq43ews7qe56KFUuDJxzbJcL9WSPWymyu7oXKRvhk4GiAZ+3
 bLG9WD/aVpzce5J7dH9/+j18PKYirkUpWvUcEIhoSXGcnRXKncDUz+2KoxSQHajjMtrh
 Lj2MfwxZGzKGt4KClbBqfBPz1ThE/6Od+9F61Wqk66CGQnRf+k+tV6cvO/iQ8cWlxUWf
 12ef7wufrr92vtA4YaUgHSigOr78dB94tlRU6ur0x/lc4ColXAz8QnaAIRXtcVd4jLQd
 Knbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1TJ7i7KgvD4fdVHGJRMyrwZBOAJHAbvbRMumj5+UHU=;
 b=ixzi5fccl16FWixjyYegMIbebtv3SuNGUjuR3NIUIuePKfK3jG9Kexxvm1gJv5rs1H
 xbq2SCge8ehX/+Ih6FHhoEqygb0ZkhZiB0Ka9S7iPNb8O6ZfVgiGjOK7p4V++yeTfxIw
 rIay9UCSMWLFiYtgxKbOK3EdzaSmbv7lmJKNkfKWgxl0+FLiNrzBAF0vUqKmrj0Uy05K
 lAuZa4jpaipv+cIXHREQ7nz32W6zdSXQ8nlu+nvwvw9EAFQPeFHQjlJ03Hqc8iTks+4L
 R8bF88jYXwRyHBs/uNS3zPTQxPRy2GCKzDhOx2OZkBc8z6AUZQL3QbbennFf3ln0/kq/
 pLtQ==
X-Gm-Message-State: AOAM532zyWbljJnA7UDj4H7qX4jyw5/6qXNc2DMJRVud4mZWwskhJaSr
 6O47KAuIz282hY7AZF3Q9p1iDUHgzRK9QpcIQGrBgw==
X-Google-Smtp-Source: ABdhPJy2/hr3Yxo3hr85EvZD23OIDokym52uhxrGItyfkdlVu4ZgoBws3YJE2JUHydA3ekG2826MMN/wIxMICXR4ifo=
X-Received: by 2002:a6b:5908:: with SMTP id n8mr1139742iob.185.1624268689710; 
 Mon, 21 Jun 2021 02:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <1624266114-21539-1-git-send-email-kewei.xu@mediatek.com>
 <1624266114-21539-4-git-send-email-kewei.xu@mediatek.com>
In-Reply-To: <1624266114-21539-4-git-send-email-kewei.xu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 21 Jun 2021 17:44:38 +0800
Message-ID: <CA+Px+wXx8eyh2QFRHbkf3ESdXzBw8LNqP=jMihju+jV0TpQvhw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] i2c: mediatek: Isolate speed setting via dts for
 special devices
To: kewei.xu@mediatek.com
Cc: bbrezillon@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, 
 mark.rutland@arm.com, linux-i3c@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com, 
 liguo.zhang@mediatek.com, xinping.qian@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_024450_993804_6E5F5B2B 
X-CRM114-Status: UNSURE (   8.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 21, 2021 at 5:03 PM <kewei.xu@mediatek.com> wrote:
> @@ -1293,8 +1355,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
>         i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
>         i2c->use_push_pull =
>                 of_property_read_bool(np, "mediatek,use-push-pull");
> -
> -       i2c_parse_fw_timings(i2c->dev, &i2c->timing_info, true);
Looks like the patch removes the line accidentally.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
