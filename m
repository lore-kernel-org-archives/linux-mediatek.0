Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02754C54E66
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hXSilYme71WxLDL2DRYbLwsJVWvIy5UEmIPg1rdydQ=; b=3kfqM9VXQNhcf3CSeUQUNRquGA
	3QzXchRO+ujKtsuiI3jAzjVuau8yNXvIyu4fmc+7leCiX+o07VcJ3JbaycOzMsMVZuL/ht1Oz+42R
	pNJRz2TIKCokGGZi8Mu4owIMj/C4vzxUMPSMhcU+erVATWeGl2i8PkIOlK90ZbIX37A/CwlCmm7W2
	I0qgqBVdNu6gmeingqqKGU7EHISBv8UChNTkqYWeBB+lg/2/LW2nvh3ko9KfF8kDhDVj6Ngtwd0Rg
	e8zWrLjeILsxf5zBN/CUJ94ilsCsda4TdI3zOLULkIZYiVeH3W0tkMpw7Sp6bg7Ubj2BGebkJHabx
	vsr+v2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjzdV-00000005P9B-0dP8;
	Tue, 12 Mar 2024 10:45:33 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjzdR-00000005P8K-1KCi;
	Tue, 12 Mar 2024 10:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710240329; x=1741776329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DD4v8R9W7lbY3AFQ+hQ0Jpk/wrmyWokjjIS0dZTNBsY=;
  b=hg9C0BECzNYjskHSn4+KzlTr1jPnxT77ocR9R3+k+ucU9OwkwOZ4bCXr
   vQGIY8ko98cSgXhvad/qiqnKIxKPi7z0YYB1lCPPT8peyEKUWf9v/tr5q
   iY/R3BhxrdjI/eUDoEAMWL+yfscbEAQdQl/sbmcJEJTJ1vqIYtH6adPeW
   alqzjUaSniDBir6fW4uKjwRQwFKvhPzKzEddZc0l4B72jHZGrX6o0z0M1
   8z0RV4hPnQgJ27ti0lqNw+YaO2xe8DAb/m3U9MKXgq+bOytqJfSZRbjxh
   BQOI0xqncoUDQrP9/aHaOU+yMGu+Pb5nlLJhhJEmewndEExU/9m2QtNX/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4793218"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4793218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="11959019"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 03:45:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 079E011F819;
	Tue, 12 Mar 2024 12:44:59 +0200 (EET)
Date: Tue, 12 Mar 2024 10:44:59 +0000
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Zhi Mao =?utf-8?B?KOavm+aZuik=?= <zhi.mao@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	Yaya Chang =?utf-8?B?KOW8tembhea4hSk=?= <Yaya.Chang@mediatek.com>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"10572168@qq.com" <10572168@qq.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Subject: Re: [PATCH v7 0/2] media: i2c: Add support for GC08A3 sensor
Message-ID: <ZfAyK42Iow-VAOam@kekkonen.localdomain>
References: <20240303022609.26263-1-zhi.mao@mediatek.com>
 <983197a9531748d7a34a77ce0a74dd7f086e827a.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <983197a9531748d7a34a77ce0a74dd7f086e827a.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_034529_389734_51410705 
X-CRM114-Status: UNSURE (   7.45  )
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

Hi Zhi,

On Tue, Mar 12, 2024 at 01:31:20AM +0000, Zhi Mao (毛智) wrote:
> ping...

The set (v6) has been in my tree for some time now:
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/>.

If you have further changes, please post them on top. Thanks.

-- 
Regards,

Sakari Ailus

