Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CCCC88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 15:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=; b=daErnP8RX+3CejZZ9ydU/SRKs0
	/mw8ob0PmzBOyRPV/HSyTd84yboeIkoi4omJZRL9euurlzEXJoVDRJRwpNurmP+Tn4lGrXW87w+oZ
	jT7ba7Dad9SZqyBf8l8PnreIwzCyGl//HWxJOB1kqvfs4AyVwTrtqHOc0IGihZWlqVvlPGXiMflRK
	afv9kzhWkUJkQ/9Or02PYeeTHvYulSd4nWjSUNG4krXYbYX6bioypmMRZYvl6Jegt01t2fD6w7eWG
	gcfkQUWRJgc9830eQ52KR8eWjKvytt6Y8/vMnWijoQcZd1n8T470YwXdPWv2o7wU0JwGJ4ONUZwCi
	fBEjtQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ufn-000000073oB-1IPs;
	Tue, 15 Sep 2026 15:02:17 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ufh-000000073lj-3ZB1
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 15:02:13 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-90cd4631090so10464286d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789484528; x=1790089328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=;
        b=ftUT6xgnNpad1MmzbtZNsym4iBXCjcO4VvpJpTWFlbr/Bm5vY2TKizD3xbHiMPc4sh
         oXCXQbz4IpHHRVvFDuplB4sRuMlsjejwxZYJzUVs0/PFjMrZQFTRhTJ+rRynTrD7UHhv
         pfwuIB9gcnZy16b1uBB4AKB2+lur31ucY18DUxZxJZG3PwhgrLTOS3Ke0YfpLbr9qb+k
         A6LS9mye2+/cBNnzfg94onGJxjOdl3SNbofvrdSaL7rtNtPYYrbwkhrUGsga6uOEB/jc
         TjawdEZ2y5SlrccyXkYxcxg2aslRVBJSUFpxP3jM6cGOc8OjGDrLSoWVcCQoqGztk24a
         sfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484528; x=1790089328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=;
        b=bz8OSVgG7rRZEYJrp8tIYOJAnhSleAtE5VvKOH5j+95NDnVh3iyhGwcbUV4nt6Z0nb
         wNcRtHaihfEMZwN0wb5gWhbyCjsMedFuSm5bVpybtJnZ52Ih7ZqZTyxA+LMUp6AjCLfZ
         YZlBxKq1m6Tzd7tMi7MreXDbXG7i4HCnBmqxn3/prn249Zb2au2or/fXnkVomkUBH6Nv
         5MvdwUk0NKecu5GLW84YYy6+MdnfhNXf/PMe0ELCtLlP6zzU9J3zMZwAzh4A2UPPZQ2z
         1SdvUhx+brQppBw1Mfc9Opx0fYevBzwjPJdWkA7w1jhIrVMRyIgHDdYZU5PbN6UC12Kz
         SsCw==
X-Forwarded-Encrypted: i=1; AKwUvBzkF4YVjQkCYCJLGnr+B897TJKqzhsHVJLSXMScjZlrPNr3WfJSNdSjit2RqOXKbNjk+BNl/3QSsBmhrzp5uA==@lists.infradead.org
X-Gm-Message-State: AFuF++mb6qQAle3kAY//VMjmSa6zTYxk7neOn6OZSO7B+G0Q3s/gNpbF
	aagHTbHXGsgfXorMA4XJr3SJG+V6koGP1/ZR61lMfuHNuyciQ1A2mF5AMTVmCaib8A==
X-Gm-Gg: AYBFou2IOFyJ1F/9YvproVn4QWUAdwXbP/B9wGmkQFeQcMZq3sU+0vwruTK08On5K/F
	+ySPfvOzpgNc6HQT3SsnOOl3/rrFG4MZlHOIib4/H3fyAnuQzaiy2ANi0f42aRk1gSQGp3NqrIT
	JGoXp3h13d5NkawHmlF/rN3qRP2vkocQbUueGeMiniPJKt8LaPp1PbDyEqVfvePEYp37Z0ZAhOq
	1uGgO+dWDws/EenpwYpXDKfjvU4BBghpHFFk6K2UcCDFvfaARq3LHyZbahC+UV/gtDG4wWgITsO
	zU5qMG54ETCsNaMDLTa4D6J55CeTZEXT9Kl5U0p9K+MxvQz/pSruIMpUT9y+FiERlWnX4hX4u3n
	B8xMJ07XyKZ1hkUuMfMyeO/hsM2rXQP4ymsAJJO0wQZF4yK/kwngvoJRn952Tv67u0ugXZVbenY
	vTmdEBy+sEcMdEKILCdmLTgbVJvHomAWI+2OV52rA4/XKHCR/d5X81Jf+nheizCkIu64No/HSOh
	D7bVkWpX0c=
X-Received: by 2002:ad4:5e8b:0:b0:8e9:cd74:87bb with SMTP id 6a1803df08f44-912343f272emr52165806d6.18.1789484526773;
        Tue, 15 Sep 2026 08:02:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bec51c7sm381356d6.38.2026.09.15.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:02:06 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:02:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] usb: core: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <e2404a51-3480-4c93-8d31-6b796879ff6f@rowland.harvard.edu>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-2-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915090223.1346-2-joshua.crofts1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080211_790740_5541A571 
X-CRM114-Status: GOOD (  15.65  )
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

On Tue, Sep 15, 2026 at 09:02:18AM +0000, Joshua Crofts wrote:
> The fail label in usb_new_device() disables pm_runtime on failure, but
> doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call.
> 
> Found using Coccinelle.
> 
> Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/usb/core/hub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3345b3298daf..dec6d5c49759 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
>  fail:
>  	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
>  	pm_runtime_disable(&udev->dev);
> +	pm_runtime_dont_use_autosuspend(&udev->dev);
>  	pm_runtime_set_suspended(&udev->dev);
>  	return err;
>  }
> -- 
> 2.47.3

Acked-by: Alan Stern <stern@rowland.harvard.edu>

