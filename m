Return-Path: <SRS0=ckIt=DZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1B5C433E7
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 18:32:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448B1206B6
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2020 18:32:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QdS3Y0Pc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxbKiA16"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448B1206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5lvwrCZ/YNpVytsqCdrTbQoG3QSrOxcGa9GwIFfXvPI=; b=QdS3Y0PcfkMXEiLMzDbJ8c+C4
	h1DjwZUo9jxKip8V2Y3ExSb5vBR6hhUQqedKzucFDNgq7GokbaG3ehcDfzeT+9BS3bPyJyIDejJ36
	N+WF84BIvRpC0vdinjO1Sjdx6p6wsHZnP/V61YQZ1WGd1BkYFtwaXvJ5HeNIRD1tAmCzyC73MKQcD
	O56+aA4myvB3RJ4Vt8nvCg6sMmh4VMLEoy83Bq9XElADHgJg6zKbVvrDgtipOUnvBKcLR0/zX5OHX
	mqgSbGZYK6DayMqjsJZfQFuVuin7KUT0OhaNNgnP8B+c6N1hsqGQsB3D7ntlHNCaXoGy2DLGMWH4+
	2CZ9DyrJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUDTh-0000kP-AN; Sun, 18 Oct 2020 18:32:21 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUDTf-0000jd-4Q; Sun, 18 Oct 2020 18:32:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id k8so4658892pfk.2;
 Sun, 18 Oct 2020 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K40T/k83wtyWOrI2mPQwTzmm6Q0OfkO1kKDuP9It5QU=;
 b=QxbKiA16yJPrNiOwUwwa1gFCJoPHFm7k2WYEA7SPcJaj9fW7e+AjbnQu7ZYrsDPTLk
 CgBPi0idOZf1OOhXdh+oe0dY5HDioNTKyo8/YTJzdpI6AelccLcGostsEer8eMTaiMXJ
 0ME0DacPTxtgdeoMxAm7syKXwpINXf7ZP+RalmZsE32v7ddFJxql8ftSez0LFBP/G8Vz
 Jftl+b4qUGyYoTThNlxLZhuK/GdI5xIE3VDJpD/rhMmv2DQWJVmQe3mc9JR3vREWV5qC
 Y3IV0C02npU2nuqzn9tK04LWJT1+/mv7tMvGmYWgeWBh83ZC53wMO66ooawxmfyebJl+
 ZzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K40T/k83wtyWOrI2mPQwTzmm6Q0OfkO1kKDuP9It5QU=;
 b=ZceIUG1qAMMFcekyLZGFf8+VfvogDiw4NNy3I5jECYScC+h+Bu4SYwcq3VllzraECY
 e0limpJtDe7cAi3xN/1kXtNujx3pXd30MB4flE/VP0HGEMID83eVLjDPV5Pg3fjKHiA/
 HJaUQlnLgRyl47PurqsLA9HssZ6IWvJqpxfS5/XbtovUMotTkeBNQ/p3yBPPo1vhMhjj
 kD6TrJH0XEjbQW8qp7MrhTAAfw9iNqIYWOgB8kiKuey+h8TcHGTCQRfg/lBMhwhM8sWg
 WetTGoICdk6/ZxLdEIPvaCiYgMbf8U+qfa4CA7jBwuLFq0CVm7HlbtUzeSyT3X+cUDYs
 OHew==
X-Gm-Message-State: AOAM53144S1RYrQXConJdRZRC4E8MsMHuV13KHeX7mLB8ZJXzxBzlGb2
 YZ6djMVRMAK4mtGUbBh0sqJPyRMIeTVkfIVTMes=
X-Google-Smtp-Source: ABdhPJy0T474mJLE0+aZoaHtqo4YHqfTdvAt7GpQnZQEKFltdgzGUdJMMj/pHuUAu+b3Ybm3jfoAJPBMnvBTXNjkWXo=
X-Received: by 2002:a63:f908:: with SMTP id h8mr4294553pgi.203.1603045935923; 
 Sun, 18 Oct 2020 11:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201018171545.3190476-1-fparent@baylibre.com>
In-Reply-To: <20201018171545.3190476-1-fparent@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 18 Oct 2020 21:31:59 +0300
Message-ID: <CAHp75VfJUhA3WmmirctmrieQfZKSNerFa=nwPmBYvffXUTRp9A@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: mediatek: fix unset field
To: Fabien Parent <fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_143219_195673_F3A8A387 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio <linux-iio@vger.kernel.org>,
 chun-hung.wu@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <jic23@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 18, 2020 at 8:16 PM Fabien Parent <fparent@baylibre.com> wrote:
>
> dev_comp field is used in a couple of places but it is never set. This
> results in kernel oops when dereferencing a NULL pointer. Set the
> `dev_comp` field correctly in the probe function.
>
> Fixes: 6d97024dce23 ("iio: adc: mediatek: mt6577-auxadc, add mt6765 support")
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Shouldn't be a blank line in the tag block.

I think Jonathan can fix it, but be more careful in the future.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
