Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFE7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:34:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4728C61284
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 01:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4728C61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WR+HnVZuNWQdwC1oErXaxmYzr71LcZXSbcHSYUeOh2g=; b=hnV2LxygIqTTf3
	xTwg+oEEtopezYPiFAOllt84J+J5Jrh8gX5eszjYh1/0fnT6DFd3Eo12ncFFiPiLdkZ/lmAnzdoGa
	s83UgG7hbp9a89XgCV4jh6MvjsT1eHydJwK7cWJFdk/v0MfkoZNtA5MPlP/RkI/riuW2hE1pwPBam
	gimv5ym5QDUaIgwItXC4ZaCHRoRl9jcmH4bLrMuuPyP5Z01jtEinPHA9s7Q3xT2/q4L4Hd3lCQI0E
	MwN4pHGRtv/BrsOSdLjDvtswpgugOwueTLQ3EQLmSq9JeGABgAELH7N17SvyudIE0ZOhTZlwbCq9J
	6RsKP6zhvoeAFF9uamNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlLSR-009Bcr-JB; Fri, 12 Nov 2021 01:34:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlLSO-009BaU-SR
 for linux-mediatek@lists.infradead.org; Fri, 12 Nov 2021 01:34:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso6280538pjb.2
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Nov 2021 17:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0YHU5BFJe1UeJmMP6VYLEudXKn26+NeOxTqKcy9fme8=;
 b=LrFnSWp7l4vvRFWqk06cZtwB/ugRwVOpRXHG+uL+eIa85OD3cC5UgUaQ/gbX+IQUgd
 N5j7X456rIqpp28T9y0cSOfeC5OOs1vsm4r9GxHHABLjSIlcZkBpqAEKnOO0fD2iRfU3
 Zi7bZij5unADfaSDgQct4cGhDgHCNsqiDS2Jnh6WDjYPDBrGOBSbCyYVcFc6PhQ/JFZ4
 RoD5uK51PLaQOhc0Udq2fvkh+ZrSztIibqX3r8mcDuuHX0s0A9BR2TySEAW1QbHRSZVy
 WZMSLHskRaYFOr1+ijUTRrVxc80eRJlnLanayATyJyudWGMIa1gLqjepUMCjqT1kxXiZ
 c1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0YHU5BFJe1UeJmMP6VYLEudXKn26+NeOxTqKcy9fme8=;
 b=DAVExLJakmpHgasyT9Bu0n4vXqPv/lm76IebX46bk+Qzt8F6appso2PnyWUBtoKHuq
 7a7r7MOE154bm/OqxcJTIgkMU4XFAjsAuJ4ViSrvbfzWAQVNcqcxzUka/DEqp1Ds0x/O
 Zuh13uEleVHYgcByQwnYAFw7199lVNPL/q2ilZMVoHXpt1+vNneH/Wm9jkExkWP3ILI4
 NKMB/DwjffInPQxxZRTyQYIz0q+VqswagcmCtexeCgNBgC0v5YYJA+/MQXkcZbPOSIPg
 bvfUnXAIxacbFXqpz92UxV9jVSYSRwqNnjRHZmNHjFasx9ZUvYxzLPCQ/clW2yBJV7fG
 p7Bg==
X-Gm-Message-State: AOAM532SOAMcgEG3AT1MCPDJDH4BocqUVL5hpFlcJ/1V77OJRpnMODiN
 s9DRanuhisSTBWyO1+LQ3NhzcA==
X-Google-Smtp-Source: ABdhPJwCqDn0a2JCQcf42AQVYBrgJG7/UP8bVjVF7dmyhdh/1aO7xtYDLnN93T7YEfSgDiy+x3pAbQ==
X-Received: by 2002:a17:90a:670e:: with SMTP id
 n14mr13311383pjj.144.1636680856755; 
 Thu, 11 Nov 2021 17:34:16 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:3f91:373b:ba9b:471e])
 by smtp.gmail.com with ESMTPSA id nn4sm3367102pjb.38.2021.11.11.17.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 17:34:16 -0800 (PST)
Date: Fri, 12 Nov 2021 09:34:13 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 mchehab@kernel.org, matthias.bgg@gmail.com, acourbot@chromium.org,
 yunfei.dong@mediatek.com, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: mtk-vcodec: Fix an error handling path in
 'asid_allocator_init()'
Message-ID: <YY3ElQfeZr4DpObV@google.com>
References: <86d3e2db237bc35eb55bd46ef07fa13a39bcdff8.1636636541.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86d3e2db237bc35eb55bd46ef07fa13a39bcdff8.1636636541.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_173420_933372_C1987AB2 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 11, 2021 at 02:17:51PM +0100, Christophe JAILLET wrote:
> In case of error the 'media_device_init()' call is not balanced by a
> corresponding 'media_device_cleanup()' call.
> 
> Add it, when needed, as already done in the remove function.
> 
> Fixes: 118add98f80e ("media: mtk-vcodec: vdec: add media device if using stateless api")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The commit title looks incorrect: "asid_allocator_init".

Except that,
Acked-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
