Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93463C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 23:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/mJA+thpRNFGlXWQ01MvYulLXwsCFHvHdP7Fs0aoKM=; b=ah4m6vglxXYx1q
	1C69Oi5ZmRd19CPHrrBNd5lY1gropQImfQyCN9tFDVy7GRWe0dePCqzEfXn4aX4/utAZyNswzcrKv
	lJdMmIgrv3RH3jj15D15+d3tSmHR2QmmHzdSPBH+BdVX0bsC6h7ctOZDODRyFanxndf97/TnO0Ubq
	b4F5k2mPMxWRX8yanaYImlfMfIOOCpN6oyEApsSb+lxCVRD6NUyJBL7Lv8J31X3OnTRzhiAkjgtiC
	GSjaGhcVOqUQjr4gbXgZ+R+JOt/So4EjGUcuINAD9F/T2Q06Hk1ZHq+rNWSlTYxgMmhbthJlRLymL
	YdCf2yxOo2nCdlVEZyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF2EF-00DnTt-Kg; Tue, 01 Feb 2022 23:06:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF2E5-00DnS4-G3; Tue, 01 Feb 2022 23:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=kzu0F19ot5U0CXhXpGsmgOBzGIvXF/v3Q09a87bCxyg=; b=gn26cEa6UIdLY+OV4ubyeB3cTC
 dJFg+fK25DZPXMP4goFy6z7Nr43CK/m7omd6BGcKlwIVnpMxy5XBOf6kWKS1ORRDdWCFttoyOurqp
 DotbZsXvUmIVn372SV+1EyMXd8B6kgejxV27J0FwYZVu683UT3IUsOfs/XIxw/NgLi6eMkZKXka+2
 iWGjxry/nEnAq4KOHhF9zASJUztmI+7+smaxr3EKNgeomwmUC2Fvxhb0k68Zjw6PiHXKrlWpdpX9B
 KKMHvIsC0y1v3Cd/ZCwvtcVebfrxkwS0c/oTRBG6JAHxcUXB8ONX3Nd4zNUPm/PSzyYsiOYrJzAhG
 H4V+TBKg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF2Dy-0060mV-Uw; Tue, 01 Feb 2022 23:06:11 +0000
Message-ID: <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
Date: Tue, 1 Feb 2022 15:06:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Kconfig CONFIG_FB dependency regression
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Arnd Bergmann <arnd@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Bing Yuan <Bing.Yuan@synopsys.com>, John Youn <John.Youn@synopsys.com>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
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



On 2/1/22 15:01, Thinh Nguyen wrote:
> Hi,
> 
> One of our test setups is unable to boot (stuck at initramfs). Git
> bisection points to the commit below:
> 
> f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
> 
> Reverting this patch resolves the issue. This issue persists in mainline
> also. Unfortunately there isn't any meaningful log. Hopefully someone
> can give some insight as to what could be the issue and revert/fix this
> issue.

Hi,
Did you enable DRM_FBDEV_EMULATION?
Please provide the failing .config file.

-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
