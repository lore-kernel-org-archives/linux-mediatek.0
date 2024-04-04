Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C661DCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSM3SSSDRISKG2xzZd8Db84CV8c+qWu1nf3t0po6PQs=; b=YWHLlCj49JaNlpG3ZN7Q0i/zfz
	8AweCgPxjayegm6dTYff4MiWrhdnoHuoxbaYgpjEyoNMrZBrSStUGP9V8lkbkoKwgCd2Rf8oO2x4d
	e+4djZRrN4ut/io9GVidYZ1nUAjgeZ13wMjcehVxUeuPmQTCDcquXWMOpTmP6Z9YJowhT8QygrRBx
	yYr9UsT8inOjEDFRGap+2WQ6GzRZYhLi3vuNaYr1C5Edxqkv6zFyNaTncIJGUS4HWo1blBUIQotTO
	O3/5yh8HGHGLYFqDB+nFm7UIdHxvQLQNPgquzrEUIcYq0PgFQARIYVn9JwnfzRSsJ4XAXMOypG2cd
	Q9TeTApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJvy-000000026z0-1NLX;
	Thu, 04 Apr 2024 10:03:02 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsJvu-000000026x4-3hEG
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 10:03:00 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dcc71031680so805894276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 03:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712224977; x=1712829777; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSM3SSSDRISKG2xzZd8Db84CV8c+qWu1nf3t0po6PQs=;
        b=JS9hPT+2SXII3Oo10z8bSBaPiJsOqKbg12pP4W7BTQzCjrR+4mH3Edi6KhKaQes3Sk
         7hl+Uyl9Hpz+mLR/8ymAeu9uIzL11WnXgI/IOki0mNORxKOBm3HNMK4JcoOJETWSATlV
         flNP520PZ8YZevXpYDLHVYAqUfowDRDOJDlWsSJP7unaoI9eimVHHSPl+1SsVM6ppVOJ
         dn1bK/Cvx+1UTTK1JQdJwr/y4LskdswnLdWttdB5/yX8Cb66T91W1zXbC6ocOSkg1VE4
         ags4hP2zv/XyuX6a6l6A8Ns1hWdXZMKSIrmUCbVA7Se3S5sqLfzr60uzptST+o20bGyW
         0U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712224977; x=1712829777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSM3SSSDRISKG2xzZd8Db84CV8c+qWu1nf3t0po6PQs=;
        b=ShohLk8ddnFMWJb8KCd6uJXyl7oGuBMHXPXkrlcyPYDjQW257X5DaySs/FVwVheU3x
         TSYCpRp5vmxIf4i91AD15HjQcqYOKsQ7Bnyhqm3l14pQ1qa64+CnqmLuX/UgXxvmdZEu
         /gCRZvEZGCQwlZzLbRizxlL7qjjOQbHAgb4+/tEc5FwA7w7u7Bvfe7KFH7ioATApJHUz
         SPwVpjS4kdtN1/JhAWQ4T0O9FFP1TBJ2FRpNOMGhfEolKZaRuZKPGqDkRjV7yCm/ZvF4
         yZ9+jW7xciAIyGNKgzNW6588H4WdBkmb5fIp4n2S0mn5zhJnP56Po6/kMaXjblEo8sUK
         N92g==
X-Forwarded-Encrypted: i=1; AJvYcCWhY4tfm58MyOipNbbUzvnpUZXXbzyPT/1WVA7MNdXXBB1AXGl0fT5DPxGkx2ydVD1J5LkjBVbRoknMKylgspb3gLB3OHaIeHA4smVLDvmiY1NC
X-Gm-Message-State: AOJu0YxLwCCtN0kqz097o7HXL/6JmCowgdJbM3k3qmABwEXqGp7VN+0y
	ubyic87O6rrZjTR4a9ZJFq0jlYQXbU6P7/bWryhw6N6L+rUZ+B06RQ2xflgAogrGVeciKxqI3v9
	d9AV80y6kPsjmoWrjNPnkK6FBmjS6tkuEOPnTIg==
X-Google-Smtp-Source: AGHT+IFm7zNDK6Xa3wkE7uder3AalB0PkZD0+78hHLf6dJfB6CcQXZnHbo8l7Iyk/qJcWuVWDZVuQ9UpgQfDLkYdDWQ=
X-Received: by 2002:a25:1e54:0:b0:dc6:ff6b:71b2 with SMTP id
 e81-20020a251e54000000b00dc6ff6b71b2mr1790403ybe.4.1712224976606; Thu, 04 Apr
 2024 03:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
 <20240327055732.28198-3-yu-chang.lee@mediatek.com> <6dd9959e-f741-47af-b10a-1894f72ae78f@linaro.org>
 <c3ca3d90-898e-44b0-ad0f-dd78c09c5fcd@linaro.org> <f3eedfb3495bb9c28b5cbf466387c24822c5b6f6.camel@mediatek.com>
 <7ff9c4c7-3b56-4a5b-95b7-c37cbf8bcd6d@linaro.org> <b957b072d5d88ed315982e914a7f700e0ccafb83.camel@mediatek.com>
 <038ccb20-71cb-40d2-9720-ce1a0d3eac8c@linaro.org> <7f24ca2806a7199e4de6fad17b8dc1f127c82180.camel@mediatek.com>
 <c59f2f33-ad6b-469d-96be-9345920370b4@linaro.org> <CAFGrd9qZhObQXvm2_abqaX83xMLqxjQETB2=wXpobDWU1CnvkA@mail.gmail.com>
 <3b04c5344435cdb941b5d132e8f5fbfdf9188d67.camel@mediatek.com>
In-Reply-To: <3b04c5344435cdb941b5d132e8f5fbfdf9188d67.camel@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Apr 2024 12:02:20 +0200
Message-ID: <CAPDyKFpokXV2gJDgowbixTvOH_5VL3B5H8eyhP+KJ5Fasm2rFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb definition
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>
Cc: "amergnat@baylibre.com" <amergnat@baylibre.com>, 
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	=?UTF-8?B?TWFuZHlKSCBMaXUgKOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?WGl1ZmVuZyBMaSAo5p2O56eA5bOwKQ==?= <Xiufeng.Li@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_030259_059771_24DDCAA8 
X-CRM114-Status: GOOD (  22.53  )
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

On Thu, 28 Mar 2024 at 07:06, Yu-chang Lee (=E6=9D=8E=E7=A6=B9=E7=92=8B)
<Yu-chang.Lee@mediatek.com> wrote:
>
> On Wed, 2024-03-27 at 12:55 +0100, Alexandre Mergnat wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hello Yu-chang Lee,
> >
> > SMI LARB must have a power domain, according to "mediatek,smi-
> > larb.yaml"
> > Now you try to create a link from power domain to larb.
> >
> > Here is my understanding: when you enable/disable power domain, the
> > larb linked to this power domain may have an issue. Then you want to
> > retrieve de LARB linked to the power domain though the dts to manage
> > the LARB.
>
> Yes, this is what I am trying to do.
>
> > IMHO, using the dts to have this information into the power
> > driver isn't necessary and may introduce some bugs if the LARB node
> > and power node in the DTS aren't aligned.
> >
> > It seems not implemented today but during the LARB probe, it should
> > "subscribe" to the linked power domain. Then, when the power domain
> > status is changing, it is able to "notify" (callback) the LARB, then
> > implement the good stuff to handle this power domain status change
> > into LARB driver.
> >
>
> The problem with this method and why "smi clamp" is in power domain
> driver is that our HW designer gave us a programming guide strictly
> states the sequence of what we need to do to power on/off power domain.
> Using callback, this sequence is no longer guaranteed and the side
> effect is unknown...

In most cases, using the runtime PM callbacks in the consumer driver
(LARB driver) is sufficient to deal with resets. For some special
cases drivers are making use of the genpd on/off notifiers
(GENPD_NOTIFY_*), as they really need to know when their devices have
been power collapsed. Have you tried both these options?

[...]

Kind regards
Uffe

