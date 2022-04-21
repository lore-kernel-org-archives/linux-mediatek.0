Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D61C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjXf1O6Fv3XpIqEbE4wm6jYxjIPv9/4vcVjqWbX17Lc=; b=Hu9hT63vXSIdKM
	mdBv29Bs8McCZnTT1c91Sz47QZpr5UsVy0hNM7WCHG7bpPhXJLQ4ALWjjnmfFgHEz/pmChzsUbC9G
	Zz/6LnADwjvlGzET4C5WYsNrdFAIM81P70fTHNysQnR3xRpwbVPhaY0dUySQ8UJS5SZjfo3Xt9sBM
	1kobK4vO4uKf33fYGITSjgQuGrzcHMWOSn8hs/WuV/L8rGf2Q/HOJ2ZNuCLO0jBlRqaKtkfZYNNJ+
	8HXKwfGM6Ho/N6dz8NHehM5hmj4tA5TPcZYZlswc3WhcSpDmjK5BI0fs89g7dlHC1lF4ORoUpVR8z
	fSxDESzDyE7BH8G20Yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhcgk-00EpFu-TU; Thu, 21 Apr 2022 19:42:02 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhcgg-00EpDr-PQ
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 19:42:00 +0000
Received: by mail-pl1-f179.google.com with SMTP id q3so6026968plg.3
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 12:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ICt5XunHqsELIdqZvSPeKFkS3NdL0ipmf4jJkro4jDI=;
 b=FBA0brvn4xV/uvtxFp6nqNrEGiXkm0aj93i4uJsOaHB21GYVbkYsfS4xDX/bQQrM7M
 d8j7pYZsUjAqJqA47FsFvsimqJHyIM3yxcF4pbisQCOA4qE2Yid41daIE4b4xRvqsfrz
 YKPemggYS4eeP4LbuxXJLxw6fcbfR3P/12jBK2zEjWqJF2i4vMcpi5UHnRPSjQzu+jE3
 1BLXKo+EjwnKA14mUdS56NtxZ6PXXaBmP2mrrh962vRJCXv/E/fn9cbSXAoNEOzzJudj
 pREzFSumLfaGFIlMYyN1o8KS32R3pIamO4r/nD2rRKtGtsp13UzNSr8+sZrfDYDG5yKN
 HEXw==
X-Gm-Message-State: AOAM5333gWs78ChKxUn12UmJ6/HJSn0BKaEm631oBfr2lPZORT3lF9FS
 F/mYnFSaFwoaMpt6xeO0qye39w==
X-Google-Smtp-Source: ABdhPJxpOKBLlWVUs2NzoRXMdBxSn5hTiUFvJaFcN6Sw89Ynkamt2rs5a60P62l9RvRwU+EuGV/FjQ==
X-Received: by 2002:a17:902:b596:b0:158:f23a:c789 with SMTP id
 a22-20020a170902b59600b00158f23ac789mr927819pls.57.1650570113700; 
 Thu, 21 Apr 2022 12:41:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 v14-20020a17090a6b0e00b001d2bff34228sm3703433pjj.9.2022.04.21.12.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 12:41:53 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen
 <HenryC.Chen@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Nishanth
 Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>
Subject: Re: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
In-Reply-To: <3d463c8b099fdb1c9a0df9e615a8ca1d8a034120.camel@mediatek.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <7hczhbe3wn.fsf@baylibre.com>
 <3d463c8b099fdb1c9a0df9e615a8ca1d8a034120.camel@mediatek.com>
Date: Thu, 21 Apr 2022 12:41:52 -0700
Message-ID: <7hsfq6ql4v.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_124158_849906_6B98367F 
X-CRM114-Status: GOOD (  19.32  )
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

Hi Roger,

Roger Lu <roger.lu@mediatek.com> writes:

> On Wed, 2022-04-20 at 16:22 -0700, Kevin Hilman wrote:

[...]

>> That being said, it would be really nice to see an integration tree
>> where this was all tested on mainline (e.g. v5.17, or v5.18-rc)
>> 
>> For example, I can apply this to v5.18-rc2 and boot on my mt8183-pumpkin
>> board, it fails to probe[1] because there is no CCI node in the upstream
>> mt8183.dtsi.
>> 
>> I'm assuming this series is also not very useful without the CPUfreq
>> series from Rex, so being able to test this, CCI and CPUfreq together on
>> MT8183 on a mainline kernel would be very helpful.
>> 
>> Kevin
>> 
>> [1]
>> [    0.573332] mtk-svs 1100b000.svs: cannot find cci node
>> [    0.574061] mtk-svs 1100b000.svs: error -ENODEV: svs platform probe fail
>
> Just share. I've tested this series on below two platforms and it works as
> expected.
> - mt8183-Krane (kernel-v5.10)
> - mt8192-Hayato (kernel-v5.4)

Unfortunately testing on v5.4 and v5.10 with lots of other additional
out-of-tree patches does not give much confidence that this series works
with upstream, especially when I've given a few reasons why it will not
work uptream.

The examples I gave above for CCI and CPUs/cluster disable are good
examples, but another one I forgot to mention is the dependency on Mali.
The SVS driver will never probe because it also depens on a "mali" node,
which doesn't exist upstream either (but panfrost does, and acutually
loads/probes fine on v5.17/v5.18) so this should be fixed to work with
upstream panfrost.

IMO, in order for this to be merged upstream, it should at least have
some basic validation with upstream, and so far I have not even been
able to make it successfuly probe.  To do that, you will need to either
provide a list of the dependencies for testing this with mainline
(e.g. CCI series, CPUfreq series, any DT changes), or even better, an
integration tree based on recent mainline (e.g. v5.17 stable, or
v5.18-rc) which shows all the patches (in addition to this series) used
to validate this on mainline.

Thanks,

Kevin




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
