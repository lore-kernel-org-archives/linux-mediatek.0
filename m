Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AD2C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 10:31:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C2123105
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 10:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C2123105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kbX8eqVQqVkwQE13ELomLgqKrErvn/u16MbEyD46nng=; b=M5E9adomI1YwxeCrD6qMXykmE
	Gl5qOq4ZRFLwyg1VVrbzEodbuehogUD3u4XIr4jL5fSKM5VsITcV5r8PYUE5MfWfSbpncYNT9syB1
	9hpN4YBfiZEVTbMPe2ENIKZ2wm24g6BpV+pGRkMJoMXzPFrwf5LvH9bwaERE64t4xWTJTwPKQ6RXT
	kF/6RmLWEBfIracaXPycRpoUlzr7ZafJXE4QvWL20+OjsE+yEqYSrDW3Ue704uFsT40BTPnyW32LL
	OsYp2zIcgj4RaaFs+FFMUsdm0U2qJvPilQCrkBx5XxhjOhS8hW8dGhRpcB+qImucFRvNPA2L3Ve9y
	5JZ7yb3Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krewa-0006dI-3J; Tue, 22 Dec 2020 10:31:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krewX-0006cL-37
 for linux-mediatek@lists.infradead.org; Tue, 22 Dec 2020 10:31:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id e25so1694205wme.0
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Dec 2020 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yjWsKgpIrIMHJTkgfV3AITTW3X6hZ0tmorI+J4SlgHk=;
 b=gSAX6vAp7rwGjwVr9KdZect0S7ffhHvL1frAWrbGRR/GIDButiKcd2wUo2svR67hsR
 uRNYfkJswpDCN6kY8KVcoVxdapcpleB9lZPz1eEHcp8ec7/4q8a/i56kwP2DeegVsire
 wXgZYHlmRvQP26en5WetBRRGrnmpnW39HajIpmljUANcMDtzc3++StWR2XK/8mgfG9+p
 drlkAL33KQEKUd27DJmhfLlrPsGeqU6JRVMuM4Pv5UA2u47hhoWU5Gna425XQ15rQaL3
 /a5tnvrJAue5thRnjUctDGyi9czxBXoIAKE+ziZjBaJ+UVD5k/jXdzJBJGgd7S8pQLEh
 C5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yjWsKgpIrIMHJTkgfV3AITTW3X6hZ0tmorI+J4SlgHk=;
 b=diM3C5kvQc0m4U0jdmx2VzfQQ4yUj8XtSy2oKmYwoBz/TeT+TBpnaKTFhyRJtlbDdt
 ps7VcdIwiX7cNfoe+N5b6ph33Qz7sVeu5ANWWNrFXM2CEh6K3V7E0yM9ZaOoVNUK6skL
 TpQCzYTXTvRsL+z+xlbNrsr14PhjRcB31csfz/1zriQB4kepsUWLptbBy+q6RgiSnhd8
 rxGGGJLsJVrfzdl52hLj7AEDE04X+/S/x1O/gQ9PEJOt2nyZ4JZGfGMU6FF0TY6yfJ/K
 PD/pmecAO2yexQHQXvIWV3yr6rtYNdPIrbnaKb8RpkJc7fjrcWyXJ1CTGtw/fTWQ2rCo
 01SA==
X-Gm-Message-State: AOAM532Zzt5T0phyx9Di6d5QnJUhAz5NLqAQe+46xtbQW2s8OKYtU0lR
 d+KYIYLKva6u1FuQdPVagbcJvA==
X-Google-Smtp-Source: ABdhPJzXGpcJch3T0AHE5uG0+3OFzMr8Axaigdjj7H1XYyRyA28dVfzU/ffnNHOMoQnte5ehH+AC8Q==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr20665428wmd.39.1608633059562; 
 Tue, 22 Dec 2020 02:30:59 -0800 (PST)
Received: from dell ([91.110.221.175])
 by smtp.gmail.com with ESMTPSA id w13sm29959833wrt.52.2020.12.22.02.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 02:30:58 -0800 (PST)
Date: Tue, 22 Dec 2020 10:30:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add bindings for MT6360 PMIC
Message-ID: <20201222103056.GF53991@dell>
References: <1597912530-5374-1-git-send-email-gene.chen.richtek@gmail.com>
 <CAE+NS37_YY1aVYv-MBsxoBXCkvj7+fBK+vZke9yG7eY1aMHLKQ@mail.gmail.com>
 <CAE+NS36_HCJvk4_f_8G=5Lke87jCgHO-i0HJ-Q27vhDkacFGEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS36_HCJvk4_f_8G=5Lke87jCgHO-i0HJ-Q27vhDkacFGEw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_053101_386962_21E7917C 
X-CRM114-Status: UNSURE (   8.08  )
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
Cc: Gene Chen <gene_chen@richtek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMSBEZWMgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBEZWFyIFJldmlld2VycywK
PiAKPiAgICAgU2hvdWxkIEkgd2FpdCBmb3IgYWxsIHN1Yi1kZXZpY2VzIGR0LWJpbmRpbmcgcmV2
aWV3IGRvbmUsIHRoZW4KPiBzZW5kIHRoZSBpbnRlZ3JhbCBiaW5kaW5nIGRvY3VtZW50PwoKUGxl
YXNlIHJlLXNlbmQgd2hhdGV2ZXIgeW91IGhhdmUuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
ClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKU
giBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJv
b2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
