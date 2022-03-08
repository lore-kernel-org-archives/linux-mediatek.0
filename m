Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rU/4ST/Z4HIE4iDcRG8L3q2ypDYMbpL/8FHkB1tQqAY=; b=dq1LUHSaxFXGk/
	i89oPsIdlUj9yzwlP3fukMsykTPPr9yfI8k7b1ZULTqODme7e0/WPA1X1UI5hQ5mpuyw4g/GJlFbo
	vDX9Y4KttCVGttb9ee78886gxBfAxj+/sw2WSwCktdDEhioPG8KkN9nHqwDClqLiS8O64csYLAXdo
	Gttx+B1nYUsn+pwH0RVO3CVrKqcgWy7ysMIcslXsldygyZd6ZQ3s8Hfa4C5QIE7qwOvvfo1StgR0B
	p50PeSDfR4x5SMrABXW+NcDhkYHZPOne79KHkyR7q7O6/+sLGDgKY7605jWwQEhtqP9SbNECmj9uU
	igyj4yIQTKylLlP3x60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRX9A-003tfu-Vb; Tue, 08 Mar 2022 10:32:53 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWyg-003os0-3E; Tue, 08 Mar 2022 10:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646734922; x=1678270922;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tlfAGEzWZupbhLz4z0/Y6/HTRgwEljOiRNv5zyXFBDo=;
 b=IIF6XHsCEggxzAr6ziXdnTd32wi1tYftd/rHomIS77B1usfr6y5PIoli
 DyqnkZgIv+W8LOyMrTW7KB5xe6isAdgQT+kzXx++aC0fIhFMmwp9mFpoT
 H4hJNNvb3xmoTyGNjr9lmMm98oic2UWCeViQOA36GgCs0il4LobgBMu28
 mFvq/91qiquDMru/C3SOUpmQBmPtppJGfVDwjXoqBADVa3uc3EtWQRixc
 0+miydphBAItH7q9b2JRhDOFMRuQzqwLblRmiO2p4U+OwwA7QmQdEBidu
 zpOyhr8kY9M9OCZeNoiKU7LKpdIuIA6ChyM5AGuuZNX7If/Sn7upGPCs8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254589322"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="254589322"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:21:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="513055616"
Received: from acushion-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.29.47])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:21:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "xinlei.lee" <xinlei.lee@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi
 funcs and delay mipi high to cooperate with panel sequence
In-Reply-To: <9e3cd215a2f771236855bdb2f5faa172dcbd1aec.camel@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
 <87lexq2aw4.fsf@intel.com>
 <9e3cd215a2f771236855bdb2f5faa172dcbd1aec.camel@mediatek.com>
Date: Tue, 08 Mar 2022 12:21:42 +0200
Message-ID: <87tuc8218p.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_022202_241260_B693EEBC 
X-CRM114-Status: GOOD (  10.56  )
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

On Tue, 08 Mar 2022, xinlei.lee <xinlei.lee@mediatek.com> wrote:
> On Fri, 2022-03-04 at 13:51 +0200, Jani Nikula wrote:
>> Please also prefix cover letters with drm/mediatek if that's the only
>> place you're touching.
>
> Thanks for your review.
> Is your suggestion for me to put the fix id on the cover ?

Heh, it's not really review, just something to ease me going through the
dri-devel mails in the future.

The cover letter subject is "Cooperate with DSI RX devices to modify dsi
funcs and delay mipi high to cooperate with panel sequence" and I don't
know whether the thread is about drm dsi helpers or some drivers and
what drivers. If the cover letter subject also had the prefix
"drm/mediatek:" like all the patches, I could've just skipped it
altogether.

Just something to consider in the future, no need to do anything here.

Thanks,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
