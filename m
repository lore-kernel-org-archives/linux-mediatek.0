Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B37C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 14:25:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789A264EF1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 14:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789A264EF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uks9XJFrgDjWnHZGGrK9RjXEOxqbiPWR5dDQgDVY3So=; b=F+4QANCz6xwvX5335TLWOGEXc
	QvClkW54Ldoxlt/JeN71mvSWRPVL6V+HotpvpcCAueu7F+UjUDQKQoQ5TeEyyzzRjr6pv0/q05dp4
	xiiJcK5/GwlfalCuqDtrG4jmgEQVHFADc8iVVoOTA2jLC8u9mmZlWjIBqaXCpt5tQpoeCYe94+kBh
	toWv9Nu004n1s9SuipCWLxg6w2Y516YBRZ+cF7fNLt3mEoDyd7vZ9e8NrbTu5eyHGxnrd58ABM/n0
	IGVYmzguLKXcV7ytZ8Cc2t9jw6S6R4yetWrBIotrIkCHQb5/nZ08eLCjAkVaRKzWNMjN5tqeo3d72
	VBnv1abhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEv69-00032e-CK; Wed, 24 Feb 2021 14:25:05 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEv67-00031f-2S; Wed, 24 Feb 2021 14:25:04 +0000
Received: by mail-wm1-f52.google.com with SMTP id u125so1971871wmg.4;
 Wed, 24 Feb 2021 06:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yNOTeF74AEVCmwolAA0/8VTyL+nE8bLyKqVdo+FWMqY=;
 b=bzPnGkZoRInOJNVuI7wJLvh89FUpMGzziYXVx6gm7EbZpaTNq1VAtMz2sl2aCUbjue
 JFxen6cW9GNKnYdVYwhMSAywil0CP94i5QGvqguAxqDHGmg0FqwZtLb4hwTkQKphCl0I
 pVUvdyMyo0x0Wi4cAgTxhiKEWR3qb1/+GrCDMIuwYMzWWYBZjuxQR+YO+nEzCFa+ZA+n
 dCPUy8YHlFqXRAk/q5+hv6OvRF0aH9HAgAkTcDt8BnVjMOaxBGSjSMZ3v8NeoDv7SY1i
 HDdQNxpME8hOcNxh4m7+OVspAbQtYRh8WIkHeMeRu2xI0IlHzUWRTBJsb0h+FM/GVkJY
 e36A==
X-Gm-Message-State: AOAM530KcBJ0D+rUTXpzXxLho5TkI9wbGtDIuARVpQVK/MmzCWcIbBjT
 zgv4prg8cRwz5XtAh0d+vd4=
X-Google-Smtp-Source: ABdhPJxfrJvj1Nu7atjaQwkrtJNZuIvIcIcghN5f788Gg2oxt+yrdZvub8CkWecyTONsxU0eMBnWow==
X-Received: by 2002:a1c:e041:: with SMTP id x62mr3285059wmg.95.1614176701475; 
 Wed, 24 Feb 2021 06:25:01 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id j16sm3898710wra.17.2021.02.24.06.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 06:25:01 -0800 (PST)
Date: Wed, 24 Feb 2021 15:24:59 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v8,4/7] PCI: mediatek-gen3: Add INTx support
Message-ID: <YDZhuwbgdUsnBD/0@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-5-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224061132.26526-5-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_092503_126753_F53440AB 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, anson.chuang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jianjun,

[...]
> +/**
> + * mtk_intx_eoi
> + * @data: pointer to chip specific data
> + *
> + * As an emulated level IRQ, its interrupt status will remain
> + * until the corresponding de-assert message is received; hence that
> + * the status can only be cleared when the interrupt has been serviced.
> + */
[...]

See my comment about the kernel-doc from the following:

  https://lore.kernel.org/linux-pci/YDZWUGcKet%2FlNWlF@rocinante/

[...]
> +	if (err) {
> +		dev_err(dev, "failed to init PCIe IRQ domain\n");
> +		return err;
> +	}
[...]

Just a nitpick.  What about using "initialize" in the above?

Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
