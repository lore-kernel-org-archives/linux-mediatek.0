Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C6ACD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 00:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k2Px/Dpl9//43iQkMGPoICtwFZ2L9ccap4B1zyOAt4=; b=OjWYv6ndf6DaORlLfvdYiTu42T
	UT2G6+QCZ/BlOAJFac2mheTxdcngEf9whiKzp14sDJwLZm+OWR3rKWEgjKrIcCr/fcuoTzmCH49QT
	aeCFSvL2kUWnY4wDO62BVTr3Oj3xKx4U4BMFsoQEX9ZLovl7FJ+E3zf8ASffjgPEC8yvKxamAxY+x
	9pQWbGiK5mDyQjY+8kqTg270MhDhC8/kmX58ZWtovH/laLsn9X85uCYN4dUQdzN1KiXS2llzfVDLz
	/53NGXfDAaSoWdxuUVwbAzZSFAS3m2q6fWSW6JsvQsig3i9vp92bFus2lE4t9K5B1ZbjZvixwzTUz
	n77kVqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtcXa-0000000DmoC-0uLH;
	Mon, 08 Apr 2024 00:07:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtcXW-0000000DmnF-1sGS;
	Mon, 08 Apr 2024 00:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B10F7CE0B52;
	Mon,  8 Apr 2024 00:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89728C433C7;
	Mon,  8 Apr 2024 00:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712534826;
	bh=4A6xrkkJR9Gpkc/uXFnyXfPY6mYgg2NhHzgcMzsviag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAc7K/zCHaVCzMj/rrqxnwJ/C7ghWjM4L3daMo8oa4RSKuW5cJK+rze9tp7hdlx3N
	 YenELiKelk4K4OVezAmKQRF9GCbJvmlU1d2HNsQfnhHV8qCL49YD4UDBHb5qRlnYIa
	 KH0y7yZbfOEffNzf+kz4Dqf7hElcYD+oGiiOM/wOCkX+aMHZ9aIeYxUbl2Fdf3bNPS
	 XH9PcxvP+vCa42bRgwQreicjhICJ/02czQXwEJGkpVpo7fn2upTax3H1GzZieOzTXl
	 WU4A5Wxy+yc9j7JP6421txn00+OmK5tnz1Z/q8KPZci3SQI7sltmWmmg+ll+ZDXOqV
	 ShzmXcSE9R/Uw==
Date: Sun, 7 Apr 2024 19:07:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Johan Hovold <johan@kernel.org>, 
	David Collins <quic_collinsd@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 1/7] dt-bindings: spmi: Add X1E80100 SPMI PMIC ARB
 schema
Message-ID: <fkwugrnak3fhkg5ig47kmy3edm45ut4dprkabntnwemjt3w2mb@7cak5zxwzw4p>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
 <20240407-spmi-multi-master-support-v9-1-fa151c1391f3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407-spmi-multi-master-support-v9-1-fa151c1391f3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_170710_773616_937A9413 
X-CRM114-Status: UNSURE (   8.12  )
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

On Sun, Apr 07, 2024 at 07:23:21PM +0300, Abel Vesa wrote:
> Add dedicated schema for X1E80100 PMIC ARB (v7) as it allows multiple
> buses by declaring them as child nodes.
> 

But is this really a "dedicated schema for X1E80100"? Isn't it "the
schema for all multi-bus controllers"?

I.e. isn't this a "dedicated schema for all platforms starting with
SM8450"?

Can you please use the commit message to document the actual reason why
you choose to create a dedicated schema for this? Is it simply to avoid
having to schema with either pmics or multiple buses as children?

Regards,
Bjorn

