Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EEDC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9QMnkuYmipKOpeUnc0mWJw1q3uDWwK59GxkGpEP2+E=; b=XXk5YAShHtPbfNhNlPetteZn6J
	b3zzrLjOjBGYN3XqrxAKKsp1zOiq//hZViZvEY5kazLlFvl3CYD7HdgJWXqzUrhWv/ZNB+nw5RyC2
	aUc8NbxxrKtI06KEcXq4OzSPdQb49FCYGUn9dpEp0lv8HRVnE+Cg7OJT41E4WtERO0F/Pq+XE6ZRp
	l4Z8LrMCiOwfqD3vZX2W6dnI/tZl1rGrq3vVYM9HSrOU1PmE/CfOwRitdwpkEWwkPQ/j9U/Rv46Nl
	ZzixF0fKBVhM24CQWSeJWZI8G0oyja00BahRQVtlt/13h+2KSt8oDxu+X3RhzunkrmJhq+bpdxEoB
	ptzHqQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7d9-007MLn-26;
	Tue, 09 Jan 2024 08:38:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7d6-007MK3-0r;
	Tue, 09 Jan 2024 08:38:37 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B523922;
	Tue,  9 Jan 2024 09:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704789446;
	bh=An17x/TosDCNv/2qZzVjPa+OEHjTqymUr94pBBedJzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYEmRngfPqsRR8BSOfq4pWwu/WzaNWtiKQrilIkHwmWcMYm01YLh6c2UejushhwGH
	 KyAuFQl4WYbSg8oL6uTbLKdQUakm9eeHEDSKgoKOHBFVKLC00T8FzN2mfk0F5dKtKL
	 hdu+GS/dyv/NSWkpUxVcGyIL2FrX6qqw07qKswvY=
Date: Tue, 9 Jan 2024 10:38:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Zhi Mao =?utf-8?B?KOavm+aZuik=?= <zhi.mao@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"gerald.loacker@wolfvision.net" <gerald.loacker@wolfvision.net>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"yunkec@chromium.org" <yunkec@chromium.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"10572168@qq.com" <10572168@qq.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] media: i2c: Add GC08A3 image sensor driver
Message-ID: <20240109083839.GH20868@pendragon.ideasonboard.com>
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
 <20231207052016.25954-2-zhi.mao@mediatek.com>
 <1d58c2b9-4206-409c-b312-87f4fb649512@linaro.org>
 <e709beb2acaf0cb68c6922f3b48431644e9a0246.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e709beb2acaf0cb68c6922f3b48431644e9a0246.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_003836_484755_FD4E5538 
X-CRM114-Status: GOOD (  11.59  )
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

Hello Zhi,

HTML e-mails are not allowed on the Linux kernel mailing list. Please
use plain text only.

[snip]

> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> 
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

This is also not appropriate for mailing lists. Please ensure that
future replies will not contain such footers. You may need to contact
your IT department if they are added automatically by the Mediatek mail
servers.

-- 
Regards,

Laurent Pinchart

