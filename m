Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9428AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 02:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcFg2sYeH5POhL79MWK4BCqKn+t0c1ECGotaK0eNF1s=; b=EHNoi9u7rnhwTW
	A1CqJwiwJ0KCzLBEOMsrLMZyGvEK2sOVWyrJnhTl7ogP76L8KYxW8R/NVh4xaq02u4FElaRnnieiV
	rMy944KWCQYgx9O500t6IJmTwGAmcfFREB2JkykA2hacdd2rBCoKfUJnbiwvoffHcyd//4w8j2BYu
	IF6fW/WvDs6W2qTPZAcj+zPD0ZOcxlmaeeOS9ZZdAm1n7Zt0oliYG7AtPGYfb8rwIg8D771j8acRU
	+gv2063X1cOLUTwB5xM7F24ryVUMtyRHngcgCMLEd+6GRCnaP9T7ZJlEUOMXjIjF062zbYJ5y9yDo
	zxnGaLChpL9aixEgEMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPbCF-0050Wg-I0; Thu, 03 Mar 2022 02:28:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPbCC-0050Tv-CI; Thu, 03 Mar 2022 02:28:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so3602052pjb.0; 
 Wed, 02 Mar 2022 18:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C6016/38QKZUQAyk5HMPjenTvm42Pe8sPBzTcqL5vmY=;
 b=qBGtve+IuFrAkJa+gsN1WQjHRs2fvQkSK1D44BenBKAqsyswWIPF49CjeAw6Lc/Xiz
 7VY9uX10GWOeYOq3Roffx9lK59MGCnSnWmLkHD6Zz3XGADMqQbIXFAspvzlfyt7tl87F
 C44YITS/y0gKUKqqxM42VKL4jH/Xx4KasojD++jZOWXtcwkx1m//DlSoFwhQEbp4i/NS
 eGEaCL2abI9d2Qo/vgVE47lljuFHl9RIsYb9haWI9DYl1+oIMHXMK3O9uyeK26H4D1AX
 Jy4saNgfSyFkb5FP8pbKE6ds3BSqIpGBCoZu+qijzq/vfSl1dGYXTnehjmH9/ySByi+z
 BIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C6016/38QKZUQAyk5HMPjenTvm42Pe8sPBzTcqL5vmY=;
 b=IzI32ltmJywPW2hPOS2D8Sot/xdxL08LPa5bCkZCdnKYpdlyifPGR8XGQZ/K2KnqK/
 hCoVVoZMMLBKkdf4+EYAKXRW3B5ckgR4xwpiOxwsbwErTiUChmcFbOLWYaEQdunuLD/W
 5wZL8dPSYXks2CWu0yDzbKE6jXLoXSnYa9+MVr7tlLI0wNXtkgbWlXijIUTHkjuAkUU8
 77Kgi+j9k5Y/tI6bcdWv0brY+82iiB5J5L3siwCTKcrVPKIC1zryto5YCHHrCTWocA9a
 7qCPe2iFJGgKbYJUoGZEZZzNr4zW3s2Hjtvg2wdji+epZhhXSHzPMbjeOOzR01kNU2Wt
 kzRA==
X-Gm-Message-State: AOAM531HNl2AmsvYRv31RyaOu2ywle+FeklwmYU2cqi7y5i+5KteOqvO
 nonSVAo4kpLOCp8k5VanYic=
X-Google-Smtp-Source: ABdhPJwdGKGtPoJbq9KB0b78P8kOQOqlHazHAUCZQHvA6TzNHcldJErwW75BUHOqmaVxrll88UvLqQ==
X-Received: by 2002:a17:902:ec90:b0:151:a632:7ebb with SMTP id
 x16-20020a170902ec9000b00151a6327ebbmr1936164plg.154.1646274473191; 
 Wed, 02 Mar 2022 18:27:53 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 d15-20020a17090ab30f00b001b8e65326b3sm359822pjr.9.2022.03.02.18.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 18:27:52 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Cc: akpm@linux-foundation.org, alsa-devel@alsa-project.org,
 amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 bjohannesmeyer@gmail.com, c.giuffrida@vu.nl, christian.koenig@amd.com,
 christophe.jaillet@wanadoo.fr, dan.carpenter@oracle.com,
 dmaengine@vger.kernel.org, drbd-dev@lists.linbit.com,
 dri-devel@lists.freedesktop.org, gustavo@embeddedor.com, h.j.bos@vu.nl,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 jakobkoschel@gmail.com, jgg@ziepe.ca, keescook@chromium.org,
 kgdb-bugreport@lists.sourceforge.net, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-block@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sgx@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux@rasmusvillemoes.dk,
 linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org, rppt@kernel.org,
 samba-technical@lists.samba.org, tglx@linutronix.de,
 tipc-discussion@lists.sourceforge.net, torvalds@linux-foundation.org,
 v9fs-developer@lists.sourceforge.net, xiam0nd.tong@gmail.com
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 10:27:29 +0800
Message-Id: <20220303022729.9321-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
References: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_182800_427407_C42C2AF2 
X-CRM114-Status: GOOD (  15.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2 Mar 2022 14:04:06 +0000, David Laight
<David.Laight@ACULAB.COM> wrote:
> I think that it would be better to make any alternate loop macro
> just set the variable to NULL on the loop exit.
> That is easier to code for and the compiler might be persuaded to
> not redo the test.

No, that would lead to a NULL dereference.

The problem is the mis-use of iterator outside the loop on exit, and
the iterator will be the HEAD's container_of pointer which pointers
to a type-confused struct. Sidenote: The *mis-use* here refers to
mistakely access to other members of the struct, instead of the
list_head member which acutally is the valid HEAD.

IOW, you would dereference a (NULL + offset_of_member) address here.

Please remind me if i missed something, thanks.

> OTOH there may be alternative definitions that can be used to get
> the compiler (or other compiler-like tools) to detect broken code.
> Even if the definition can't possibly generate a working kerrnel.

The "list_for_each_entry_inside(pos, type, head, member)" way makes
the iterator invisiable outside the loop, and would be catched by
compiler if use-after-loop things happened.

Can you share your "alternative definitions" details? thanks!

--
Xiaomeng Tong

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
