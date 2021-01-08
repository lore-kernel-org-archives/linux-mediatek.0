Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9959AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 05:45:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500E2224B1
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 05:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 500E2224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4lTBOWzWUj2Y8XqG0DEk6pqBhlvw2PukFje2DnwEHOY=; b=cDPTFL3A6NnfIwMXrtVG1ajPN
	FNJAgZ6DNzZbqySTpTlvMQnzRkgQLIVqb6IZfK/9QiXnMOm/zAAmLh51+8JhJdBqzDODh4H78gsI3
	pilwMztA3UNhmjpVK/qND4VP5ZtziR75KO91ZlPd6cMBkRo5WVYnC8vSr+vizJLX+l35WC+4ZodUu
	5yylj6AO2pELfyzZsNumY2c+09H/4oCqImXzhgmPEE5wj1QN0oxO96wUHKGCMkBva4E7DK/Zl3OD2
	je/MB5rSwYMEUBXGruNHWghhXicRdmFaFRJDHHfACNf8fFeEtLE2pivjPEYfybJ9KZxMKoJ+cW7BM
	u38Y2gccw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxka3-0005Wb-0h; Fri, 08 Jan 2021 05:44:59 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxka0-0005VN-4j; Fri, 08 Jan 2021 05:44:56 +0000
Received: by mail-ot1-x32a.google.com with SMTP id d20so8719394otl.3;
 Thu, 07 Jan 2021 21:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dN7XgZiaahG9n5z68abqbWJt/hKn0HehLbVW0HG4KYk=;
 b=F4LCR8SFeymr3L6I9IMpBAqOjln4fubvxWUuu6ZbsmU6xWctmjkVDqa+j23NsdZUeJ
 2lbqgRfSx8pm609CeYUMden0X8f5qH0Irp+ydwQKmqYgw8Z/6D4RTFRsSX+YyUOd119c
 9Bfc29kUfbjj8Aexwzt4aip5WXjbRpz8nWT6aOd1V3JMENtdyA4LHiQiG8eJpurVTeIy
 ZwdlHbwIKT5W3nTD4Enql9zHaIfSiBNnraX9hviwAlz9ArpOFQOtMUtvUr4i/JL0AFLg
 PJB5KhL9JJxqUQvAYTMixwTdGoG2EKKDtBMXClSsECz+IZ25fZyF3dIntGJugRg4O1B2
 N8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dN7XgZiaahG9n5z68abqbWJt/hKn0HehLbVW0HG4KYk=;
 b=WaPhDVFiz6cisZtcZrQYGVzrocVLpBGne7HdkCUJxpz5hBt7Nsgsp5Nf/Zv6XB9DX0
 JCvTtvOB34Ztwi2ks5Z3kEFpbJhZcbMuMG86HIszwtlvuFFRppHJ/k3DD9PVr6PoaOtD
 ZFQFX+bSypWNHeJEf+kLHLxvYZDlXMnM3HO8R6ajXCEw8Ng1B7kBmP93PfDnivm5aCnn
 p969fMha4Ypu/ckjiBh/oIj3z8isYy27DSCmTyb4H4crR2yYAzhscsFjYgEpeB15YY4Q
 az+UbCVLYH2mlX4zBHE8PKrFbasbfTH7m24RJxL5SrCJ2F2FBBpBVcxD8UEB4l7570dS
 9UxA==
X-Gm-Message-State: AOAM530jKVOKtBha0Mvazpc9Ega/1vvz+5dkqgKU/5VCO1MS95Za6vmB
 ZamELnxtZQUpYKBeHeWkyhEQWmagP09q8sAD/+E=
X-Google-Smtp-Source: ABdhPJxqkHD8/hZsHWha7Yg6Ebl6JiAOdmUjcNyUQaZ32Ho/phTwGNlSwM+/HgMhRNU7VRuWjAVkOMCF0dWpbckONuk=
X-Received: by 2002:a9d:730e:: with SMTP id e14mr1531093otk.74.1610084688599; 
 Thu, 07 Jan 2021 21:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20210108025155.31556-1-dqfext@gmail.com>
In-Reply-To: <20210108025155.31556-1-dqfext@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 Jan 2021 06:44:37 +0100
Message-ID: <CAMhs-H-xJZUkm78eJcP8QctB9HFfVtMqWC=gM7E-6WfqwPgn0A@mail.gmail.com>
Subject: Re: [PATCH] staging: mt7621-dts: remove obsolete switch node
To: DENG Qingfang <dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_004456_199738_51486BDE 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, NeilBrown <neil@brown.name>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rosen Penev <rosenp@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 8, 2021 at 3:52 AM DENG Qingfang <dqfext@gmail.com> wrote:
>
> This was for OpenWrt's swconfig driver, which never made it upstream,
> and was also superseded by MT7530 DSA driver.
>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 7 -------
>  1 file changed, 7 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
