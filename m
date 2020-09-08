Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B4FC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 07:44:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D03E021D43
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 07:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POflH5BP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oVZ2dDz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D03E021D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQBskQjDhYBc1H7ODXfRRLMyG7AKTtttgH2A7SOh3AE=; b=POflH5BPNRLbuz7qTUbQOkCl4
	m2m20jhQwPn9WI/4hBjwzmpTFRuPqYzZO31kt5vGQRZzMQoFTz5p8afe5AvBlJ++jMI6GsM0NbFxm
	49Y9pie3Jk1duLciPLRgQyWBRJ39lGlQ96Qv7L2LAu1TGsKOQqUuK/NMAsg4ZBsAgbshlOxxY3bs7
	De3P8jumec/oEq53v6iyWwKpHt3tDAhG8vXQxeE97lTPcv7YU0xrS0VEUwKwcndOVniLpbe1k0KfM
	/WOIqUxaCPUuEr/xCKnfeKjcXlh1eaHkHxViREhipNSPBBxWGFtI8r7tvsmrsiOk/0a67VOy9fw+1
	6EE6c55zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFYIU-0005Td-SW; Tue, 08 Sep 2020 07:44:10 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFYIR-0005SE-9P; Tue, 08 Sep 2020 07:44:07 +0000
Received: by mail-pf1-x444.google.com with SMTP id o68so10275549pfg.2;
 Tue, 08 Sep 2020 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IVVptDGcawqgCuuuuSn+C2jXTROtX0l06oj8pxRbmDQ=;
 b=oVZ2dDz61KRGBUGd9CGEgxF82wuH/rzVX+9OLfCTI861b+hiYaJpaQ/FpLrdz3i2Zz
 BAen+xFFQex3W9/zOZLw3jIDHCgQPCsaMnYuM6wLgEgvEMKeCy3T2uszHuB8NzbQtuUH
 I0lnBx6aplXO78W76+Jicp8hUG94cqe7qhSC86RwjrmTY9X8RoOOqf16/EkoQNI9meQW
 DFsu95xxQ5WuHU4Th1hZA+JJXolMAX7NJI9d48U5X7TOqMlDYRH8Q+BDGeQrxaTujsLP
 kQPPj67kOpJIytiLMg3d5twjYk1iugvpH4k5Pvh0xz61RjEuKqfhcMVyPzWnUJV7P4yy
 KXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IVVptDGcawqgCuuuuSn+C2jXTROtX0l06oj8pxRbmDQ=;
 b=qtr+XJ6qHjD9BHkd+n3iZywnTg3jmVyT+yj63PGlBRnxEDWSpaV26322tBfhIGqnuI
 Sp4QGD7pLn4eamJPqxtj16cU5W8u/cWFrzscsseQf+B5QZ0zAjZ0s7MfYacehtyaPW+j
 hnF7iGtqwhxJ8BY7pPgqv6buTbfYSNF2CyItNWXPLoHgvHVGzhgr80anKuJN58KY2i+y
 j34es7soQWHh8b3CgqsBQ+U1QHIrRWHfTigmgJDtWYuN3z3CJcokgXir+nuA1iGbJWju
 3m7Mzc2zRYh5ppg2LlnlCTTCHO7qlHkgj0ShUdqlPvibkF7jc74xbibQXf4sy8Fed1sr
 L9/Q==
X-Gm-Message-State: AOAM533GzFvichlTWweGWCugqU3a1nZ88KfGd48+NLnjv/HMENKmzhwA
 I7F8nq1tdCItVry4PSNZsDDymm8BhknC/ZChOBM=
X-Google-Smtp-Source: ABdhPJxllos9y1Gn8EfWASnfyzEMYZqQ9haDoiwp/plzKOAUA/WuFCjJRj8iGwXbCw/UjhJ9hb3DRxl5t3F8B7XcfEI=
X-Received: by 2002:a62:838a:: with SMTP id h132mr23492945pfe.72.1599551045021; 
 Tue, 08 Sep 2020 00:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <1598259985-12517-1-git-send-email-gene.chen.richtek@gmail.com>
 <1598259985-12517-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200829181157.1b653a88@archlinux>
 <CAE+NS36j4a6k-JSUbjxzpfbqtE-xMW7qxUUhHPAnc_9V-Lv7LQ@mail.gmail.com>
In-Reply-To: <CAE+NS36j4a6k-JSUbjxzpfbqtE-xMW7qxUUhHPAnc_9V-Lv7LQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 8 Sep 2020 10:43:47 +0300
Message-ID: <CAHp75VcX6P9LOw=1=UgX4tWaxa2_PYPvanpDLG0TE2XzPBatAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] iio: adc: mt6360: Add ADC driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_034407_395306_9B5EF827 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio <linux-iio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Meerwald <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Jonathan Cameron <jic23@kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgOCwgMjAyMCBhdCA5OjE5IEFNIEdlbmUgQ2hlbiA8Z2VuZS5jaGVuLnJpY2h0
ZWtAZ21haWwuY29tPiB3cm90ZToKPiBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3Jn
PiDmlrwgMjAyMOW5tDjmnIgzMOaXpSDpgLHml6Ug5LiK5Y2IMToxMuWvq+mBk++8mgo+ID4gT24g
TW9uLCAyNCBBdWcgMjAyMCAxNzowNjoyNCArMDgwMAo+ID4gR2VuZSBDaGVuIDxnZW5lLmNoZW4u
cmljaHRla0BnbWFpbC5jb20+IHdyb3RlOgoKPiA+IEEgZmV3IGNvbW1lbnRzIGlubGluZS4gIFRo
ZSBiaWcgb25lIGNlbnRyZXMgb24gd2h5IHdlIGNhbid0Cj4gPiBleHBvc2UgdGhlIGNoYW5uZWxz
IGFzIF9yYXcsIF9vZmZzZXQgYW5kIF9zY2FsZT8KPiA+Cj4KPiBJIHRoaW5rIGkgaGF2ZSAzIHJl
YXNvbiBmb3IgdXNlIHJlYWwgdmFsdWUsCj4gQURDIGlzIHVzZWQgdG8gZ2V0IHJlYWwgdmFsdWUg
cmF0aGVyIHRoYW4gcmF3IGRhdGEgd2hpY2ggaXMgbm90IG1lYW5pbmdmdWwuCj4gQW5kIEkgY2Fu
IGRlY2lkZSB3aGljaCBmb3JtdWxhIG5lZWRzIGFwcGx5IGFjY29yZGluZyB0byBkaWZmZXJlbnQg
Y29uZGl0aW9uLgo+IEFsc28gdGhlIGp1bmN0aW9uIHRlbXBlcmF0dXJlIGNoYW5uZWwgX3NjYWxl
IGlzIGZsb2F0aW5nIHBvaW50IDEuMDUKPiB3aGljaCBpcyBub3QgZWFzeSB0byBleHByZXNzLgoK
SXQncyBlYXN5IHRvIGV4cHJlc3MuIExpa2Ugb3RoZXIgdmFsdWVzIGluIElJTyBzdWJzeXN0ZW0g
d2hpY2ggYXJlIGZsb2F0LgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
