Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083FBCA5512
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 09:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpFYAXnOqxjLWxlwZ45c7Msf6OlbS0bhBMJrCMsl3zg=; b=t/zS8mxri2Ql/HoXHNZz5brO/6
	HXyOP3SDGq0kMsQV6YZ44oMLJiM5BBMBMt/YYNiPvXf2AzM1E7bJ1lzTafG2+GK/TeVPKQ2K/PS+2
	Y7Lm+6fM2wzVRac+n+mhWzsH/GF7np3AlII49gcUDFFMgiKml6UoIJHIX+Y2E4uRZwq/pdAKl6t2f
	GySf9ldr5HYH07tnRYXY5zPaG0Jzruq8eGLk3Gn3rd6C7VUo7NWJaSuPD0OnEN0oYAO2XDHHmmpe9
	5nWY+BrPaS8X6/D5eYWdk+9xx73OXk51425I95jg4blrWUXU64Bzox4rK3exDM53U8a405WgJIHUE
	yDw5EOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgM7d-005Izy-05;
	Wed, 13 Sep 2023 09:25:21 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgM7Z-005Iya-0B;
	Wed, 13 Sep 2023 09:25:18 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68fbb10dea4so2717368b3a.3;
        Wed, 13 Sep 2023 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694597115; x=1695201915; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NpFYAXnOqxjLWxlwZ45c7Msf6OlbS0bhBMJrCMsl3zg=;
        b=UdQLQajxtprfLb5ks2RP+l2SmxsFJjwysvp7TGhWkPj/a3G7kBJpJWKUs9fYYrl9qW
         RwUIlOOIPJHk4a771D8Xqi3zaAoP187OmmNBZz8caU+KbffIoQdGn2Khwg9cxvolnSeg
         C51+AIMqqakEE6RCsHnHJWjeYTwSPk8UicgaPUje7N5w9we4qoCyMErEGJWtd451VR4V
         N71JR6A0M3q9hDHop7YyCRolkR1F0zd4U0kzTNWnj8EKAnZCUQZMSMVCEa7Td0CfmW08
         I6X+1BSu9W6QsJdjLUC/A2ggpaT/JUQ/zrBPq6tIkK+L2rOzNwfSLd9i8oVzaSAMfZmb
         wvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694597115; x=1695201915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpFYAXnOqxjLWxlwZ45c7Msf6OlbS0bhBMJrCMsl3zg=;
        b=YG2JAB+HUfNBIexkm06EKXIl6AvHh3fCmE5FsPnFbAUm8IHavCQnJ2cXndy4r2CUAP
         ZJSiTix0R8DGF+9F9c3qZ2XqCYDOkCR4BZTgk3qr1M03fR3Tu5edRQKVOuoKyww5oGoI
         +38GOb7K+nYxflzh4kNacl36LzZN62iyEa2CvX+CVaQionTJ7UIHY6nEjMewaoe4HfFk
         wK7nXrFCqO9odz1vUyGgB0zlWNKnNlckrRK8pLoBKrC+Bgk0ok6CAz552U/NRD0IWzCK
         AjGLI+f7ChVVQqqALdObsUPl69GX0R6BaxaiQp7rjJw7F9sKR6fYBdRHmnw6zNo/Ouav
         ngUA==
X-Gm-Message-State: AOJu0YzYaxJIR10ls5JdAOxmQtvGC6m2+dZI3W7oDHQez5oufT5yKLc+
	umFOPkOf+YlH2cojkn/zSPM=
X-Google-Smtp-Source: AGHT+IG/3WIzQMbIKyGZtuuCHIWrLbl2lrCKitCBZEZyOjDkgyQfkCiMeKwYbJrLvyEtH8At6O8gvQ==
X-Received: by 2002:a05:6a20:8f1f:b0:13f:c40c:379 with SMTP id b31-20020a056a208f1f00b0013fc40c0379mr2117577pzk.13.1694597115404;
        Wed, 13 Sep 2023 02:25:15 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id i4-20020a170902eb4400b001b8b26fa6c1sm9914334pli.115.2023.09.13.02.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:25:14 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 9D86780666AA; Wed, 13 Sep 2023 16:25:11 +0700 (WIB)
Date: Wed, 13 Sep 2023 16:25:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>, <corbet@lwn.net>,
	<agross@kernel.org>, <andersson@kernel.org>,
	<konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<keescook@chromium.org>, <tony.luck@intel.com>,
	<gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>,
	<linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
	<vigneshr@ti.com>, <nm@ti.com>, <matthias.bgg@gmail.com>,
	<kgene@kernel.org>, <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
	<quic_tsoni@quicinc.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
Subject: Re: [REBASE PATCH v5 01/17] docs: qcom: Add qualcomm minidump guide
Message-ID: <ZQF_9-nX47QUCycO@debian.me>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-2-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1694429639-21484-2-git-send-email-quic_mojha@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_022517_119327_B579659E 
X-CRM114-Status: UNSURE (   9.77  )
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

On Mon, Sep 11, 2023 at 04:23:43PM +0530, Mukesh Ojha wrote:
> +Qualcomm APSS Minidump kernel driver concept
> +--------------------------------------------
> +::
> +
> <snipped>...
> +Dump collection
> +---------------
> +
> +	+-----------+
> +	|           |
> +	|           |         +------+
> +	|           |         |      |
> +	|           |         +--+---+ Product(Qualcomm SoC)
> +	+-----------+             |
> +	|+++++++++++|<------------+
> +	|+++++++++++|    usb cable
> +	+-----------+
> +            x86_64 PC
> +

Sphinx reports htmldocs warnings:

/home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:100: WARNING: Literal block expected; none found.
/home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:243: WARNING: Unexpected indentation.
/home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:234: WARNING: Malformed table.

+-----------+
|           |
|           |         +------+
|           |         |      |
|           |         +--+---+ Product(Qualcomm SoC)
+-----------+             |
|+++++++++++|<------------+
|+++++++++++|    usb cable
+-----------+
/home/bagas/repo/linux-kernel/Documentation/admin-guide/qcom_minidump.rst:243: WARNING: Blank line required after table.

I have to apply the fixup:

---- >8 ----
diff --git a/Documentation/admin-guide/qcom_minidump.rst b/Documentation/admin-guide/qcom_minidump.rst
index 20202da8ca40b9..5709a3853ae7ea 100644
--- a/Documentation/admin-guide/qcom_minidump.rst
+++ b/Documentation/admin-guide/qcom_minidump.rst
@@ -95,7 +95,6 @@ could be anywhere scattered in the DDR.
 
 Qualcomm APSS Minidump kernel driver concept
 --------------------------------------------
-::
 
 Qualcomm APSS minidump kernel driver adds the capability to add Linux
 region to be dumped as part of RAM dump collection. At the moment,
@@ -231,6 +230,8 @@ respective dump as per set download mode.
 Dump collection
 ---------------
 
+::
+
 	+-----------+
 	|           |
 	|           |         +------+

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

