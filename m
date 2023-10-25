Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013D9C0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 04:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaFfZaeMrOrqsZ1V0ZdeNxl6PLQt0XTbArkRbtCUiGo=; b=jRWp+IshT4ntWa0EXAatZL4nAB
	mv5FKgpLZzf/3a7FWFpZ9lrGbYLNqtVvuMTjWCc9oMnZE1JB0bQq6cWSBYAbsSNLXvfeJVDqyYfpN
	HvoXaNGwEUikZnW7KB4cUl93Yf8dCe1RD6tFexMJp4tDkmhS93Ev5iyBaBcwagSVbr6uRpMQ9jv/L
	Fz5KLhWPlFawGExlbI7Obc9oScWEKBumpQRENRadXqDLUozXirfhIQnG8N55BAOEaoQXQCRb/h3fU
	vQzj5mDsKzoDu5klMWhYLqynF+xfILt7MrC/Qs8yIq14h+A6L1EXB3ZblazE8sPfbXrUcwDgLCw8l
	88nkYAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvVtk-00BN8M-2n;
	Wed, 25 Oct 2023 04:53:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvVti-00BN7z-2D
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 04:53:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40838915cecso42895575e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 21:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698209614; x=1698814414; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zaFfZaeMrOrqsZ1V0ZdeNxl6PLQt0XTbArkRbtCUiGo=;
        b=kVKFucAxS4uj59GqRoUkxbqR+Cy0+dRVFB1J46X0dGJPK+PB7Jmjr0VuO3A2y59XKT
         2E9+pkkBI4cutTaDh5iN/xFuD2PqVUMv3Df9NDrmz0EjFin1ogsA7YB/+MPKJbVfNwgJ
         6Hh/7AqIhGdTRLoyNMCdTSABDwDzvsQubUXevIBu7yQ2aDPItxNSy/99iiUtFSKInWJV
         ITSE0vvnU8U4DzLHtEqSLGrKNlwIf47PQtotM1G8XVUlCv5A0xzoaWpK83w777GHO8ZW
         kSr6JXQRBzebpobUTgNRJBsarXpKS2iSbH01L/yLQ2miJ88BxXV/99OzNZ/8HQf3JTba
         H7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698209614; x=1698814414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaFfZaeMrOrqsZ1V0ZdeNxl6PLQt0XTbArkRbtCUiGo=;
        b=aVNs8Dt3DEwg2QeQADz5ddd7gwTYQ/7Jxo7aQBZ9uOm6+qjNFim4ki+4kwS8uB+Jib
         IaRXeaScbwqHeodc1UThv52CYWQqXdgn+1aZEuO6kvg5XsPXHkpVps0qrukh9IBSnwew
         U4UIcGumDHuYJsFiiKOBiHVCWu6DhbIfS5PuNiNeBOpfBF5sncc27nm6usFvAuBFb6vr
         ScZy5OeY2p3hQHJej/a//rjHtm+sk4IH9NgLxSRZUUKrQHww80veA41kdEUZzZjMzYiq
         XgFBdx5/6wn6rU4QawvsTmc9syYDFPGY0YLo//Nc5Z0ExTAnVrvW7uc4X4eEVh4cjbD7
         Dypg==
X-Gm-Message-State: AOJu0Yw3zRhDScCOdzzwaY7wmeQoTv3Ln+tmhw229kSJEH8Iul3OeBzk
	sl7BRGQMbN5y9QjOnHcoSoKXEw==
X-Google-Smtp-Source: AGHT+IFXVzgaWky+CaOs5ETvH8rKVTQIFtqsbm3nYu6XYEq4R12UFVKb4cBcG+dJ4/fYuiW8zkkTYQ==
X-Received: by 2002:a5d:4989:0:b0:32c:a930:fe0e with SMTP id r9-20020a5d4989000000b0032ca930fe0emr9732988wrq.14.1698209613822;
        Tue, 24 Oct 2023 21:53:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b0032da87e32e2sm11286132wrq.4.2023.10.24.21.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 21:53:33 -0700 (PDT)
Date: Wed, 25 Oct 2023 07:53:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: Re: [bug report] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
 rt5650 support
Message-ID: <4ccc2a1e-2704-400a-953a-9f6659b274f4@kadam.mountain>
References: <de95f385-3eb0-44c0-bb71-c9bc993b55be@moroto.mountain>
 <CADYyEwSMB9QQCZVuTC=+m8wZJFxkXzzZPhV6wv2-TsZAXa1j8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYyEwSMB9QQCZVuTC=+m8wZJFxkXzzZPhV6wv2-TsZAXa1j8A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_215338_731175_22DE6602 
X-CRM114-Status: UNSURE (   5.44  )
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

Thanks so much.  This is usefull.

regards,
dan carpenter


