Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F12C48291
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KQgUb9tVbh59ba8vJNsxrmB5fm41n7Ak+Ie50uJY50=; b=QYVfdoZYC6XNf8eQliSiounyhe
	efJovJbnW7vIUQ2wlmoWJn+FcB2J26LD/EgzDWh/lVUemLbQPoVFrcpee30BH8Q7dbDLI6wf0Dwd9
	w9EEBoevWL2vbJFV2lNqSnvlgukJShV3i21B7nxuyd7JykJJD/Zyljcf9XFb29+8/dwsBZMmed4z+
	FAiaj5AHnvuUCKGmgcqB0C93uue5u2wPgchXkUTSTYELKf3nZNFWdMCWekJ7UHsClALImXY9foum+
	bcL92uvzSJBVhcif/ujr4TnZykeUIB+pttd7JFUD2fc3ITVvPuYSRUwLHyrzWRKVeP1jX9BQqlX/M
	giRUxmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWwE2-00000002ny3-0ArF;
	Mon, 05 Feb 2024 10:29:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWwDx-00000002nvT-2Cck;
	Mon, 05 Feb 2024 10:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7BF760FDC;
	Mon,  5 Feb 2024 10:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91ABC433C7;
	Mon,  5 Feb 2024 10:29:03 +0000 (UTC)
Message-ID: <201ae1d1-1e03-40e2-9cc4-49df70abb8da@xs4all.nl>
Date: Mon, 5 Feb 2024 11:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] linux: v4l2-vp9.h: Fix kerneldoc
Content-Language: en-US, nl
To: Ricardo Ribalda <ribalda@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-amlogic@lists.infradead.org, Sakari Ailus <sakari.ailus@iki.fi>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <ZbTTb-SdK-EubGdc@valkosipuli.retiisi.eu>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZbTTb-SdK-EubGdc@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_022913_638323_3BD9D532 
X-CRM114-Status: GOOD (  13.30  )
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

On 27/01/2024 10:57, Sakari Ailus wrote:
> Hi Ricardo,
> 
> On Fri, Jan 26, 2024 at 11:16:16PM +0000, Ricardo Ribalda wrote:
>> Kerneldoc cannot understand arrays defined like
>> v4l2_frame_symbol_counts.
>>
>> Adding an asterisk to the name does do the trick.
>>
>> Disable the kerneldoc notation for now, it is already ignored:
>> https://docs.kernel.org/search.html?q=v4l2_vp9_frame_symbol_counts
> 
> Wouldn't it be nicer to fix kerneldoc instead? It might not be difficult at
> all.
> 
> Feel free to, but I can also give it a try.
> 

It would be nice to have this fixed in kerneldoc itself. I'm holding this
patch back for two weeks to see if someone wants to work on kerneldoc.

If not, then I'll take this anyway to fix the noise in our build.

Note that while this header is indeed ignored in the documentation, that
is really more a bug and it would be nice to actually include this header
somewhere in our documentation. So fixing these kerneldoc warnings one way
or another is something that we should do.

Regards,

	Hans

