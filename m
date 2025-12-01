Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA8D116F1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cmFzub/Ypc6pcPBJnk2rpItrwarW2n0unLQwqzI/cY=; b=TYZpIBw00dTNk/ml1JjgdFSEGF
	6UygnVpxsHrg/g4bsV45Z6r6uBH216AMJT1KrGMlHS/Bf76NXnjXELGoh7dhcM0k612p7ExHB/2C+
	mXzKL5ytj696Dk0J3AmQc/5CNbWLESMZlSbrwQA6bPAPlUE130VzOomog+n43mut5Ukl842G7SXte
	+pPClecsc9AddFRVkZYE0a1ibK0L+oEG1leRvQP8SKx0RuflsBe/Lvv5seFTckR9MAvK/YtdYBGed
	Hv0VTk/vKLqNwtNc4UIf155hw4J24TsA4+Q8fpN7+viMcGfwi8tm03Jzf59n/HxJkt+0wF4bu1+z7
	K6MyCNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzlK-00000003Awe-1r4R;
	Mon, 01 Dec 2025 09:00:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzlH-00000003Av4-2mld
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 09:00:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so2780185f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 00:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764579598; x=1765184398; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0cmFzub/Ypc6pcPBJnk2rpItrwarW2n0unLQwqzI/cY=;
        b=XlaJN3DhTzxBj2pqg3I4wXU9lFiUzKILlmV9/V/9sWxNXeJMZE5aZ6aDs1/SWQbIQY
         PdNs4R49KvqG09LG9JxJ+unZ4jyeRKmWz+hogo/QtCclWInG9l8s15MKHrinEJCMRTh2
         wC022XQHIu+tbkWx64o1Ve/baF/zbm8hm+K7iJ9ejHL+lMicZj6bVHXl3NgsMZNlMwDn
         H28f6lvah3J6IV4XtT40rxBCNdPBS5iO7SvkbMAk71Sl87wWylCrG8+b4akBT3MK83aM
         LDLxNJ5yY8k3EdDm8IetUNxp+6AMPayCdGR84GduNS8vVJgvBYmw8rf0/XVOF+NW2tvf
         F+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764579598; x=1765184398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cmFzub/Ypc6pcPBJnk2rpItrwarW2n0unLQwqzI/cY=;
        b=BiUGtxammCGZWobcezoTaMYcNgEoaQIImH56mucak0qP/LWVQUmM/v/Tbcxwwb+s9j
         ILW/baaRIiZoHDwtXGORP9vFOiuggeMun+9r/bZJG2ucySUe/mIcWhlHPnDExTFMGlEk
         z03vZIvRJbPPYdDJ1BQ4WoIl+x+y5FUCysr7OS0A5GlBMDCPzkhDiTdoOW4OqqjhE9A2
         dFgD9aPSYLfmL2Tc/ZXd4CkEWUqqV7fP7B/0ltay7BsZ1M24lSC4dLkR5QYoqjc20k5m
         NPnv5My7XLuGgCjnGF9FaRnPPnhmqBPMbz6Jqr4f8tlILj9H01JNbC69EjLyxKRBaS6D
         DO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXPyAGEKd/wfUTrKARMYyxV7oNBV9cZ2dn9l/cyRO9r1sQwsvX2qO7fYZ73J2XOfxELBwrnHfvqEjMP/byng==@lists.infradead.org
X-Gm-Message-State: AOJu0YycRkU1nPUC3x9VBBplIRZI1qpI6eWsQlNfk6ONwE05YV+xuEU3
	KI0cChKUQpIrG4HBYI8bsV73FonIGsdg/OfXnktfcdMsG9YuXWlkClzCbvSpgA==
X-Gm-Gg: ASbGncsrrXPIthqFsdQDFTgEGsoEN/6YKJVLzJAP2RCj8j+Qy7zXXf8J8KC0KvWLxhq
	fsWwWgGenawfsVfDnS8tpgI4zhHDaOKCOrUhLOPlAsykBLkV+56IwqMdyfrAWwwVurvK4VwJdFb
	WY1kAW0RVGC/aPf2dQ27XTVPyRVKowk/QbD9lbaRZFI7MwbZe4lhdd2RX6iegi4DgDogmkoccw1
	x1JBmRTDIHQei5tdrVaZS6g5rAcRONgV+bRmcewGNRd7l0QST5OJkvbGOdxFAhuqLTk61jRNn4U
	s96bsAQevyXH+W/mq52epQfeoTfMGt08+IzECGDR1Pe++wxhOrVQ7BrPzBz3XEsUs3x+mJI3RmM
	hxW3/eJaSh7dbdc3m7JbJMjSMzPJOrkxJZEi12ibRsCdSYaW5zT+dIs7pBihnRjRvEYUu4w9RpV
	+fLrT6AlBlWOyu6uYDhv4+IzIx3Ks=
X-Google-Smtp-Source: AGHT+IEOa736pXo0/WJD4acqB/BdSl155lhGxRAO7bq/cz6pjE/kshkcCp3gRvHiSfviAaM/CB44pQ==
X-Received: by 2002:a05:6000:200c:b0:42b:4139:579e with SMTP id ffacd0b85a97d-42cc1d1983fmr38638725f8f.43.1764579597732;
        Mon, 01 Dec 2025 00:59:57 -0800 (PST)
Received: from owl5 ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1cab9af3sm24362786f8f.41.2025.12.01.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:59:57 -0800 (PST)
Date: Mon, 1 Dec 2025 09:59:55 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Ezurio LLC
Message-ID: <aS1ZCy2G03zZLH6D@owl5>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
 <20251201084140.376058-2-bisson.gary@gmail.com>
 <f9e30721-a636-41dc-93ab-ca960e0415ab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e30721-a636-41dc-93ab-ca960e0415ab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_005959_725440_28403F00 
X-CRM114-Status: GOOD (  19.38  )
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

Hi,

On Mon, Dec 01, 2025 at 09:50:07AM +0100, Krzysztof Kozlowski wrote:
> On 01/12/2025 09:41, Gary Bisson wrote:
> > Ezurio is the new name of Laird Connectivity after it acquired Boundary
> > Devices.
> > 
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > ---
> > Cc: robh@kernel.org
> > Cc: krzk+dt@kernel.org
> 
> Why only two of us? Please don't work on old kernels, some ancient code.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.

Actually I'm using master so the get_maintainer.pl output is fine, just
wasn't using b4 and addding the CC myself, will resend with b4 and will
update the patches per your review.

> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the quick review of the series.

Regards,
Gary

