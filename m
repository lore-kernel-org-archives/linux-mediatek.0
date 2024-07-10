Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DE2C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK0ZtBYtuw7fpnAqJ6Vx7USrS3cI47s6ZHZHseYaOts=; b=R6xGr/6awsPPszigfKdOLTl7bL
	AkNGwNtwtbLwvoyEsUyz8ec+cNTKYFDODQpAm1yJNHi/AiA5zwOD04T9fUhJ2bXLgsiSZKfOI1Z1J
	Jy+wQA5TklHoV/czFtBGfostA9IMJROG5qJieCR6WZKIOWCY3NZ7QhZqrYMU/XPVJ3X+8XaWwpd27
	fgKcLNyCXDUpNKK2npiaChaPuwbEF40rxU+Z66XoPUZrhqVdpS/gWhP9wC+v1l+230gL1/4jmaP9o
	RXG6mLpF5IVnNsdx/vJskPi0j74Z2Y+xk757yZC7wwTZTwLhI3EBt+NTjvWvXkmh/kOC3oaCXs07o
	ygLN4fog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZeW-0000000B1qs-3wNP;
	Wed, 10 Jul 2024 15:54:44 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZeE-0000000B1ma-40G7
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 15:54:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70af3d9169bso4311710b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jul 2024 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720626866; x=1721231666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nK0ZtBYtuw7fpnAqJ6Vx7USrS3cI47s6ZHZHseYaOts=;
        b=KIlREnNZf/UvuT/G3ehlRsKVwp5YNxN+ex4wVGQ4LP4CHNvzagGQi6tVGvYd4qqNp7
         tDLt8tGtI+GcjAw/FAACHDxZuqXpCieYdF0vK0w/pk2n6v5hL5XHgZmWzMnOdzDfeSSj
         1Y/1NGQLO+hb/t23Sh1wRIqYrRMFnM1GL/xca9mjB6aA0c1IORBK79WWJ/VvasFwlmdO
         iakPFNY28B6Fen2PXQsX2+7iEKzcWMA7QYrxY1uyuQGKBV4E1Yy+PNJvJa188UMCGtJr
         GG1Bj7dTlkWUWYJQbFRJHkpufXelvZYdl3Gy6IuFpWGXOlZJltYmeWj6XRZAOYYbQvmG
         pPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626866; x=1721231666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK0ZtBYtuw7fpnAqJ6Vx7USrS3cI47s6ZHZHseYaOts=;
        b=LTwomqoM4vQEK7Thlnb15AgvM1JJ33eGcyFRF5jZJhn/VGnYCIeh3guihs3Zej61GB
         COWE8LQ5Xg7ubnlTGjkOnikpoN5sCnl/Zsp/GoweCQL//qo58eGz57hETh80QZmq95rw
         mUocehqSQwMYcsezEpsYvO3QVm5B3E5O9VxD6K5TK0renn3zQcUuYV2HfZyGQ0T90FXX
         gIEldZUFNhAW2QAS8HGbKbGj7odO8gv4QUsFCQkyTVAyWWTwdbO3CGz4sx+PIKQ8wGZ4
         O8oUkUuxbLSDH5aEHDCnoOAKmEKmZW1Q+FQUw0h7YPjO/cugERkcSQLWjFSqNbuVFo8z
         p6xw==
X-Forwarded-Encrypted: i=1; AJvYcCWTVh74aN5ZtF4t2J6BEZkqppdl2O62W3KDVmHKWViG4wbcOYA6lldwixpHRB+srrNOIsPL4p3uJ0UxfpReVFm2nCdIe1vEZw/9S2Iz9+XVH0Gi
X-Gm-Message-State: AOJu0YzTVnxAMhCzVMrhjuZngL7hLlfxzPxMsoxSShIgkQtHu30Ssl3r
	r7+6cx+3FB29XxgacxsJ+SGkkFEwc1fXawDnvxHSGXR4opFMFXdr7No/VYuhzaQ=
X-Google-Smtp-Source: AGHT+IGBjfdGcpzMj6d4WA2gZ3ribwtBdZ/W3krvf0I4UIgH0q8heu072Iu/MgBGkLWE/ls9bwaHVw==
X-Received: by 2002:a05:6a20:a11b:b0:1c1:61a9:de5a with SMTP id adf61e73a8af0-1c298243012mr6526092637.32.1720626865760;
        Wed, 10 Jul 2024 08:54:25 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8408:4ecd:288d:848b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab7687sm35271645ad.140.2024.07.10.08.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 08:54:25 -0700 (PDT)
Date: Wed, 10 Jul 2024 09:54:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shun-yi Wang <shun-yi.wang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jason-ch.chen@mediatek.com, yaya.chang@mediatek.com,
	teddy.chen@mediatek.com, olivia.wen@mediatek.com
Subject: Re: [PATCH 0/1] Support multiple reserved memory regions
Message-ID: <Zo6urhrP/Wl57sUp@p14s>
References: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_085427_188162_7EED00C0 
X-CRM114-Status: GOOD (  13.09  )
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

Good morning,

On Wed, Jul 03, 2024 at 07:53:07PM +0800, Shun-yi Wang wrote:
> From: "shun-yi.wang" <shun-yi.wang@mediatek.com>
> 
> Besides the reserved memory region for SCP, there are additional 
> reserved memory regions for specific hardware use.
> Currently, only a single memory region is supported.
> Modifications are made to support multiple memory regions.
> 

This is the changelog that should be in the patch.  Usually there is no need for
a cover letter when there is a single patch in the set.

> shun-yi.wang (1):
>   remoteproc: mediatek: support multiple reserved memory
> 
>  drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> -- 
> 2.18.0
> 

