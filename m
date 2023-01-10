Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E614C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liyTD8kZN+VJiroRLr8l9K3r5/CB+eOjRyoY0GEnNto=; b=GZVJ3rgH+YAecvDZ+FKa3DZp/m
	I5bGSB0XuqVsnmcqINF3Jvun24u5D5/sUepwh8mFVcYOY3lv9HgJHtwVDHg9YU4FkE/apsAoc/137
	I6cUdNSC3XMZLHBNreAvWEv10GGjkruiF0ah+8EblvR0MBQeepB/ty+Fu1gNA2wXz+wRGVbKd4WYr
	bnpcd2aAeFCluZRQORq6+nYME/RdqeEDM9TJi6PuH0TQMwbhRkTUvE6Kunm+XnixklPaFaDOGoFmd
	E+N0Duhs2BVVj+9ROGwi4eriEY3lyFemP8yUXoMeuYeQsjTxKYubZ8Ym0lAM8+SuMKp24AL3Uu0/J
	A1tzK7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFFVO-007HNz-E2; Tue, 10 Jan 2023 14:21:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFFVA-007HEp-JZ
	for linux-mediatek@lists.infradead.org; Tue, 10 Jan 2023 14:21:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id ay40so8912623wmb.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jan 2023 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liyTD8kZN+VJiroRLr8l9K3r5/CB+eOjRyoY0GEnNto=;
        b=Es3Z1g+oh8f+c06foHQ1GV+ZKr97m8fGyY0/oPZpjfwDZQrLcUp0vyNSMLxjekUuej
         T3bgHP+pM/83eBnqgMUR/PtbGhXWm7rHW/KJ0vEtEOtnG7C/cglsv3d/QNIuYkgEjm7i
         evHiyk0pYU/RSuLDP2DZ29SM2JwWGTKzgN6fGyuIgViqeJB0dGwoX+KWu7sDFnVvEmtb
         jcpTOXerKhAZBWG92EccZBbshvXP1Ch7fGPcRb1WksetqOLl0aIa6wBbceaqiFZSG4GD
         jrygSV+g5ggEEot9jbCbgcJxyfTyJUhzSMfo+h44AN/y3+R0cxa6pdUGVgozEuxqY4Q4
         BtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liyTD8kZN+VJiroRLr8l9K3r5/CB+eOjRyoY0GEnNto=;
        b=5fmy/dZ/lYF3UCtHJZRpiwbB3ZuzV2umBYmrC4hwvgy0xA9ScqyvD1X/0l8L9qbPou
         5FtDDnZt28yjFl7ToTPunG07Lo82zS/LO2G5Dprgj79pwGCoWP3e+33Fc3C/i5ecGNG0
         hGu5KUh+v1RcckRL+FA+7GYRhSyeIICpCaIKC0h9KQpOuISC3/iKOsOs6RgFMxkLUvSN
         enp3IBr7vcih2x1lguUkFfmqm/2PoENOBtfiwa/C1QOEwmgZeLhpveXquCCKa3kWjo+0
         iYtZnyi8vzC8Sy7U9FMXxllUfpi/FdMWd/R+ZG/IYZAydYOSfa17fDE6xFRTUdJjuF4V
         6uzQ==
X-Gm-Message-State: AFqh2kpODTlG7yEQvnYu10SkNWxAcdZ/mKd7IqPgzsRY4lLRe7xt7lg6
	fCLBhuym5SIfPtWDIypLtPtH/g==
X-Google-Smtp-Source: AMrXdXuNjH+i9dFOXqBb7TEvhlDjx16HuNabSp7vHXWViPs7mGvrXmbrr8HmiRDwYR0s3uQkiCY93Q==
X-Received: by 2002:a05:600c:2844:b0:3da:4e:8dfe with SMTP id r4-20020a05600c284400b003da004e8dfemr183826wmb.38.1673360477384;
        Tue, 10 Jan 2023 06:21:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f15-20020a7bcd0f000000b003d9a71ee54dsm14640561wmj.36.2023.01.10.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:21:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20230110031242.4917-1-miles.chen@mediatek.com>
References: <20230110031242.4917-1-miles.chen@mediatek.com>
Subject: Re: [PATCH] firmware: meson_sm: stop using 0 as NULL pointer
Message-Id: <167336047652.1961574.14299477052580291272.b4-ty@linaro.org>
Date: Tue, 10 Jan 2023 15:21:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_062120_654253_66CBEF20 
X-CRM114-Status: GOOD (  10.67  )
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

On Tue, 10 Jan 2023 11:12:42 +0800, Miles Chen wrote:
> Use NULL for NULL pointer to fix the following sparse warning:
> drivers/firmware/meson/meson_sm.c:85:24: sparse: warning: Using plain integer as NULL pointer
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/drivers)

[1/1] firmware: meson_sm: stop using 0 as NULL pointer
      https://git.kernel.org/amlogic/c/fcdc53aceed413dce3ef1d0166a8e9348d5a9c94

These changes has been applied on the intermediate git tree [1].

The v6.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

