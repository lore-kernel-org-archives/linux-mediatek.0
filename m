Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF802C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4OmxzWTp3bPAd96EI+L0etWJDdpwjVHzXI7C6X6Ni4=; b=NIEXzFhw0gIPo1
	vcU8BIBRRTkOEs516CRlNb4skmubRCS0YcL5Je/TSeh2KGBPWFzZZAip2XRN8eYoN5S99LQZGpNud
	Cso3J4Ypxzg7eceArupbb2+7N+0xL/us61mGbfoheGrAGJhNLAlrn7rU7I7YbL0iJxbmvRBhhBAfp
	KwAukgIxehy7EkS0+db1+Ugt6OWUoKiXtFchun2VUaF24H7ihn4Kb3Qw23hpRam439Ckb3pLxAVyA
	UioFZ9uax6xOnpUA58RByKaYcbuf/9s5fEaLwDJay7za8wxPPoKBgVai71ONDFrSAhBLacPw6RVdF
	dLA/m/80/3CHSXCGD/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncvd6-001EAF-1U; Fri, 08 Apr 2022 20:54:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncvcv-001E7J-4w
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 20:54:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id p25so2686852pfn.13
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=s2fZHIotgsxswHvP6sguOxIbmh2IU0gAkJkvl8us6mg=;
 b=kSFN4A0aUO7j8SQVn5H/Fqr4jiYtS3UROq0rDlzzLesv4zln2QvOKFdhoBiD9nrnC/
 ly6HOweBb7Y5mjm30ZI8ER4Re7zKQSAGymlBiqijlENVEIFYc2ZzF5hFv8CvosOQL9lc
 lC5sjl4V1mY5YoZsvNeeBGsn0cHuojNJtdav3e8b9n3m90EyJ3EvkcY17N5xM6EifeKI
 ZcUvor38Bav3ISeUKVY4+7HmiA4Vugkp8gijpYdcN+hHV249zDdfnXZH1+welko7hklG
 PKbutjw0UbA3REDa4Md8VLUI2Ol/jr9gYv+b86jyY/fpCBngvmZPhPAoaG5BjgUApDN7
 BeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=s2fZHIotgsxswHvP6sguOxIbmh2IU0gAkJkvl8us6mg=;
 b=ypPKakeajnPtHx/48c1ISapwVJN4j5d/8ZcxNG1qBc7lM5jOX9V9xfS4CQEp+8rKS+
 BLGc48K1jqJsf5fQNlOAaubpC03lFECGPAutD0NVXCxxRQpesKSRDNNobuQhsYJ8NS1v
 N9KGo0qbZuaLLVjFxmLqyhFcdG+BCh8rzOAEmJzlr3+Jc1MGiAsBVOMaAQVUvobLMcZ3
 3lOAi8zp1Gd+qVUMlQ/q2IO27teFz5aFg3awRNDIzquyMM2GRS3FTSXu9kMPJ694QSAy
 n1mJxuYDyXHfQs5TjEze4ugqYJ/u+lJuPEUpplqBrkUom7BUqUBxGY2pqA0VQyUXV0nX
 FxKg==
X-Gm-Message-State: AOAM5322RGA63SWH/WHedjdoUJFfI3mcUZ6cYvmua2Jql38sAaS7NeeI
 CfzZIjONEDc7a8pRhO19G2+Uag==
X-Google-Smtp-Source: ABdhPJzl2qcM0uP6/pCLd+oZzLdz9tDMXdCr5zj20GepMe5DR+cWERKZFDNS6wBxjC7dH6BrquqL6w==
X-Received: by 2002:a63:121d:0:b0:39c:c252:135a with SMTP id
 h29-20020a63121d000000b0039cc252135amr9281357pgl.289.1649451277433; 
 Fri, 08 Apr 2022 13:54:37 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 s35-20020a056a001c6300b004fb20b5d6c1sm26732009pfw.40.2022.04.08.13.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 13:54:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
In-Reply-To: <20220408045908.21671-14-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
Date: Fri, 08 Apr 2022 13:54:36 -0700
Message-ID: <7hfsmn5m9f.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_135441_213045_519E7A20 
X-CRM114-Status: GOOD (  12.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>
> In some MediaTek SoCs, like MT8183, CPU and CCI share the same power
> supplies. Cpufreq needs to check if CCI devfreq exists and wait until
> CCI devfreq ready before scaling frequency.
>
> - Add is_ccifreq_ready() to link CCI device to CPI, and CPU will start
>   DVFS when CCI is ready.
> - Add platform data for MT8183.
>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

The checks here are not enough, and will lead to unexpected behavior.
IIUC, before doing DVFS, you're checking:

1) if the "cci" DT node is present and
2) if the driver for that device is bound

If both those conditions are not met, you don't actually fail, you just
silently do nothing in ->set_target().  As Angelo pointed out also, this
is not a good idea, and will be rather confusing to users.

The same thing would happen if the cci DT node was present, but the CCI
devfreq driver was disabled.  Silent failure would also be quite
unexpected behavior.  Similarily, if the cci DT node is not present at
all (like it is in current upstream DT), this CPUfreq driver will
silently do nothing.  Not good.

So, this patch needs to handle several scenarios:

1) CCI DT node not present

In this case, the driver should still operate normally.  With no CCI
node, or driver there's no conflict.

2) CCI DT present/enabled but not yet bound

In this case, you could return -EAGAIN as suggested by Angelo, or maybe
better, it should do a deferred probe.

3) CCI DT present, but driver disabled

This case is similar to (1), this driver should continue to work.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
