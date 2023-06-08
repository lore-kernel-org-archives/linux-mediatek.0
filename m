Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70C1C7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtme5s3dRQf7Gtdgff/AfDj88pgSYDNPfGdCGVzp2R0=; b=z6EJjBWK7l52++gpugfVFa8I37
	uU9K+oM8JoeW48nNiNqGtfUIbDNGPcN5KqUcAt+mrVh3jElhzoBGc8y4sMToV9RQ7MGFyNa6+FGS+
	MclgqYK9LHPKhsjqXMjkBc88c4KwevGUhb4zR9uyk05lw46BZ1ekbGt3PzQDt2pWKmotT6WKaW8WC
	PIJHCSWH2d/Z9pdYma5E/SoUAzF6IV5N6Nwo6vTPkZ3fnK1LrcaNeMdZjUYVGesvOgiA9JSEk3YIF
	wmQM1Aq+5/7qHWjPWK5iUX5sUhzrUjDhPbiiNMA2r/7ZGwFWODs63EA4Y66COtpO87nXqQkLGVgrq
	qiW9RwmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BSx-008cbT-2Q;
	Thu, 08 Jun 2023 08:57:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BSu-008ca7-2N
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 08:57:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f7f543fe2fso2758815e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686214673; x=1688806673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jtme5s3dRQf7Gtdgff/AfDj88pgSYDNPfGdCGVzp2R0=;
        b=gra6jAlodbU30t5m7gbdPhx1pmD3IYs4W5CF5e7hZz0ughSR54Qmhb0FbJWse1Xlm1
         XdkDYHT+hlIKFWiiLJznQwhuxbGB9YuXZh4ntt22vuiYvDYkACBpWgER6p6r72F/Rh0H
         vSqJo1zRg9aIqJRGg10zUQSMhHH4lVZmTeok6WF4OWh8Dn0ls4YORpjvQU30QHQp2hL3
         dfhtKEIW5f3FTrczaxzXv1CvHEPVLZ/97Z/FZ1tgXON9l+d8tAUWIpv758ut5jfiDuvl
         1lB3D1lkIuQ/yEhN0TUavj6iR5hTRCPAWRUBn/UTtS0tpLfPXvLV0TLHq+nstox4cO/y
         wszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214673; x=1688806673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtme5s3dRQf7Gtdgff/AfDj88pgSYDNPfGdCGVzp2R0=;
        b=WVSHn1fGnh02SEJmKvH65iijCMxiNz+pb6qd/qK8zLeYqmUfruqw9O1UyjUau93vwO
         KgzNaP7oyAu1qWBeGUFjXKoAXwKPs0HoJISzV0I7iDJn2fCB2ty8//H+PjAvxXZsLNni
         6bh5gDb7ciIXRzU3t1Rf9Y5+jB7O9C52wcbvrzwMoeB36UbA0+a67dpOVMInuQtqpf5g
         CWDc/fxrT76h4ZfoyAVMffx+Ogd4zXPiED2NgEzb7jYHmuAgzo28ydaqkI4Q34KBiSZy
         Uu7Vo/CvQQUzZQ6rz/Ut6eK4mS6a10DiPEWn8I5eOBCa71omkXqAu4ZElL9qx7Lsou09
         6ymg==
X-Gm-Message-State: AC+VfDz2gl1/tuN1oK3A0jqbGQuzQSksz8vS83nifOHEsa/FP4cdLHiC
	+tvpOLf3kvXL0makAEGlt2+sLQ==
X-Google-Smtp-Source: ACHHUZ5Oj7KBjt/jU4KYcCWRyKtv4qWOgTZdAtGVt+sxedJk020uqbAfEPNcT/IfNVY3AFUKbwvv7A==
X-Received: by 2002:a05:600c:364b:b0:3f1:93c2:4df7 with SMTP id y11-20020a05600c364b00b003f193c24df7mr780513wmq.5.1686214672973;
        Thu, 08 Jun 2023 01:57:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c379100b003f4e3ed98ffsm1259957wmr.35.2023.06.08.01.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 01:57:50 -0700 (PDT)
Date: Thu, 8 Jun 2023 11:57:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] SoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Message-ID: <72aee5eb-792e-40c0-83a5-79618fca30a3@kadam.mountain>
References: <42f2a995-3545-40bf-82a0-fd9b8abc16ce@moroto.mountain>
 <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a667139fd91f980eca1936aed7c973b750d30858.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_015756_777456_0B864FB9 
X-CRM114-Status: GOOD (  19.23  )
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

On Thu, Jun 08, 2023 at 04:02:07AM +0000, Trevor Wu (吳文良) wrote:
> On Wed, 2023-06-07 at 17:57 +0300, Dan Carpenter wrote:
> >  This code triggers a Smatch static checker warning and does sort of
> > look like an error path.
> > 
> > sound/soc/mediatek/mt8188/mt8188-mt6359.c:597
> > mt8188_max98390_codec_init() warn: missing error code? 'ret'
> > 
> > However, returning 0 is intentional.  Make that explicit.
> 
> Hi Dan,
> 
> There are several similar instances in this file. If using 'return
> ret;' is not recommended, should we update all of them simultaneously?
> 
> For instance, the value of 'ret' at the end of this function should
> also be zero.
> 

I would prefer that, yes.  "return 0;" is always more clear than
"return ret;"

I didn't change the "return ret;" at the end of the functions because
they were obviously intentional.  I'm doing static analysis and I have
an unpublished check which complains about the return ret at the end
of the function but I'm not going to publish it because that doesn't
find bugs and I'm only focused on bugs.

When we have code like:

	ret = frob();
	if (ret)
		return ret;

	if (x == 1)
		return ret;

More often than not, that is a bug.  But if it's code like:

	ret = frob();
	if (ret)
		return ret;

	frob();
	frob();
	frob();

	return ret;

Then that's probably not a bug.

regards,
dan carpenter


