Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8609EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fiNv0Alai9EH7dZDCi1PyHKKwG3IbGXbZWz3fQBsea8=; b=uaYbA++rHESbpqi8xLP1cHVew9
	/vkw+5Lc/pG9jICtvsurLMRYGDLG/bnY1H5NBMDoATgDOglwUntCYDBKAnY9GQ1sIL3LRaFnvzgYn
	npYZaagwimX49CUqBebczcAP901ZpEu4UynD41UxAyoHNfT2OiH7CoxjNST76UV3rZH3Y9IE6IKXl
	CMFl8lRQhGM7TTOfki3g+mKIoNgioju9AMvlJNYA6xj9ckWFtrwv9qXb43HEml8CukV5H9KA/n8XE
	FmO9gS6VDi/hkj+w5uy/Rq3iHBtf3MuQNz/xsG2T7TCphyLhTbRNPPEuqxlC5q936vW3Tp81rBMbE
	oprHVVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9vtH-0066e0-2e; Fri, 08 Jul 2022 21:51:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9vt6-0066cd-8B; Fri, 08 Jul 2022 21:51:49 +0000
Received: by mail-pg1-x535.google.com with SMTP id bh13so66356pgb.4;
        Fri, 08 Jul 2022 14:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fiNv0Alai9EH7dZDCi1PyHKKwG3IbGXbZWz3fQBsea8=;
        b=MSz4Sm3eITqXDffTpexNgFQFo7gFIvmPs3JBn/F3fpFocDwbkg+WMkcfNId1grcwDG
         XkQTIF4u6HzejKTwBGiZMndZt7BKxB3EvqqHTtc1tZtuD7nQpqHfz5LvG9h0wbKJXqtJ
         IyeMFo7h29QSXPSQbs2AwS0Ca//VgT7ATmPQx4ibHMKh+I5pGCd8NU9kWuV/qZzmQeHA
         U8EptU0ZICnSwyv4n5DwO1iBLnAUjJw8vANMr5ESSPQhXu2W/uNvRYfU6SeiDJNhTW8W
         ABUVnBrvOVMmDE7vDUXktoKQ9tYBy2Q9LwuXdVd6aCsMsL+bkeMeABQvqDElBTiN82RV
         JcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fiNv0Alai9EH7dZDCi1PyHKKwG3IbGXbZWz3fQBsea8=;
        b=8PDrYkIBHWpqZqoijz8mJj28jwTkwQgD7dknmaNLU5CjNdHLdNlkAV8EwtsUhy9bce
         cYXudG0cK9VoaRWC41P6gHNCJq99saQpNTzxrk3q2uXzax0up07l1nTcU/VURePqzTGc
         7MRxSmyyQ2p21prjTeLBnWlxEeL07YCxchKSi9+aZimZi2IGwvJlsoISHcuWBXaWtstL
         9wQTGBzpftWq5NtnZ4Jx8oYzc5XL6mt2lOPSP93k+wMc1ZJkoljtUZYjj65YEb5MYjx2
         CGLqloZpZkHgPQSfkcRYcI4zkjV2paoZEa5UhbuiBjUy3uLaaAHJ6yuFnVtxW+61hUGx
         CFkg==
X-Gm-Message-State: AJIora+FS6PZHBWi8dkx8BG7eSgROXjSwGwqg4B+wQJe1gOa8jpxkmWI
	uIqO6ZiRWrfghfATE1sGQVol7unc+ok=
X-Google-Smtp-Source: AGRyM1uYhqCsDi8OmJDblGFpyMNCU0JzLEh/Ftbo6SVxxodcocclwAq3ghkXUpOOn8qg0rjTEYq0qg==
X-Received: by 2002:a63:87c8:0:b0:415:b0c1:56f5 with SMTP id i191-20020a6387c8000000b00415b0c156f5mr5165733pge.352.1657317105874;
        Fri, 08 Jul 2022 14:51:45 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9707:b37:49b0:77c2])
        by smtp.gmail.com with ESMTPSA id lk5-20020a17090b33c500b001ef92e0e7c1sm2137246pjb.10.2022.07.08.14.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 14:51:44 -0700 (PDT)
Date: Fri, 8 Jul 2022 14:51:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
	matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] Input: mtk-pmic-keys - Add support for MT6331
 PMIC keys
Message-ID: <Ysim7S2xjkbCFDJ1@google.com>
References: <20220706101122.201007-1-angelogioacchino.delregno@collabora.com>
 <202207061915.tYTQKEhu-lkp@intel.com>
 <4e55465d-ccf1-56b0-dfa4-84832edfa937@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e55465d-ccf1-56b0-dfa4-84832edfa937@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_145148_327727_C9FCB4FA 
X-CRM114-Status: GOOD (  12.22  )
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

On Wed, Jul 06, 2022 at 02:13:45PM +0200, AngeloGioacchino Del Regno wrote:
> Il 06/07/22 13:44, kernel test robot ha scritto:
> > Hi AngeloGioacchino,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on dtor-input/next]
> > [also build test ERROR on linus/master v5.19-rc5 next-20220705]
> 
> 
> This patch compiles fine on next-20220706.

Unfortunately linux/mfd/mt6331/registers.h is still not in mainline. We
either need to wait when it gets there or ask Lee for an immutable
branch that would contain shared definitions that I cam pull from.

Thanks.

-- 
Dmitry

