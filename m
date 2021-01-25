Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22899C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:36:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8744224DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8744224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lvY1GjyXzO4aYxmiCZ7sLNSTcCpzg+8QbZUunm0y9eI=; b=bTsbT1mSck+ywLEfU+zZFttQp
	RaOBo46eOeBhfRK9Mlabcof80BZw3KAO6S06g8Cm1tcNubX1Ki8clYpSGaaZAsSVsZkUVcghI2wZ6
	rwL21wFZAjdbX7FKbpEsyLu1xIgTZeSiER8UZ0o1SAUQigtSTKvDFcR+wjOITH3Ve+zTaMqQxetG/
	rHY6CNY1gaoGeDtFoX0KcEZxgmBnEpNXhSLqMrK49K/jd20RbSfAaA7At7Yp6mXgenM5S8gJhzeoA
	5UDY2lNgesydOEQ6HJm07loF5n9i4n+wIwvvb9T7TqEHPrwGdiUl/XmUiCFe6DA5PXl2xeraOLOUn
	ijDH6WMJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47eU-0004ci-E5; Mon, 25 Jan 2021 19:35:54 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47eR-0004bc-2V; Mon, 25 Jan 2021 19:35:51 +0000
Received: by mail-ot1-f45.google.com with SMTP id f6so13903334ots.9;
 Mon, 25 Jan 2021 11:35:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OauOcSb/fHxVVdQrMG7tG8Z48E9h3ry+EbDmqm+9VYA=;
 b=DCDTIzF0DvCiyi7E8wpYxz2W1v8BCcYBGKKl6w2EQRsQe1XBABEO61yDfOWgLDuDFO
 q7T56JT4vvgQstUk2yZrPaJMkgcZVdBBrSuCdg/d4cDEekEaCvCjVwhKfUPodhPL8I6a
 +EVYaBPP/XOMdW0Sr2eVxJoQ3Nbd32QDyTav6GWg4hhNWItv+UczetRVuPUd9KeY92dr
 YBDm95VxI3UY0vIaLFheusQOSS/VNXQpdThHNLXpsrOXe9SQYGDKQqnfVBEuQOYxuEww
 AR5hF42oL06XrLZ1pD/UmkwttXDBNXTINrcbPzmzHw4TS88xRToQ/95x5yJawCHpDHHr
 Xk6w==
X-Gm-Message-State: AOAM530gW4YCEE3Y11ZX3Q48Z0SeKmYdsSJmExrao7mBAMfBvhSpqSwt
 lOh6n361vQhS0qDT56Svqg==
X-Google-Smtp-Source: ABdhPJyr/h9AMGbSIK7K4NzU9OGvK66wej0PW5UdDzKiIGjcVOBKc5aBylhcbh7sXJuoU/CjEhIHrg==
X-Received: by 2002:a05:6830:2414:: with SMTP id
 j20mr1513500ots.326.1611603349932; 
 Mon, 25 Jan 2021 11:35:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r5sm2430411otd.24.2021.01.25.11.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:35:48 -0800 (PST)
Received: (nullmailer pid 829406 invoked by uid 1000);
 Mon, 25 Jan 2021 19:35:47 -0000
Date: Mon, 25 Jan 2021 13:35:47 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 21/24] dt-bindings: display: mediatek: update mediatek,
 dpi.yaml reference
Message-ID: <20210125193547.GA829138@robh.at.kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
 <3bf906f39b797d18800abd387187cce71296e5eb.1610535350.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bf906f39b797d18800abd387187cce71296e5eb.1610535350.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_143551_128059_92943AF4 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 11:59:22 +0100, Mauro Carvalho Chehab wrote:
> Changeset 9273cf7d3942 ("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
> renamed: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> to: Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml.
> 
> Update its cross-reference accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
