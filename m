Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317AEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IKlGXcuDZV7LZqYjBm0PiKLWUi1ptP7WT/jXPdjEKo=; b=I1PyTv80LWAZDh
	y41dKBiT6tfmA+CXDgpKJMdCwtFIv5trQTnVtAZNbaCgVamQeDpMT/+xZYPb1+mGI5rGJWLxSZonl
	emqV8PG1XrWRpvOMK4f3hEyR0qI9GXqL85FXOnz+uAwnqtSJThQqP99f4GvGGm0QA65/Py49Y4I1H
	UjnmHeiTIy9I7nZowtgaMFiBaH8EF+NB5nj2yRFjJZ6AkWcGngd9xQhZmet1BQsnWSI5VzhLcZWlg
	/Mn4mrIDh2wDqxw8DeIL88zW13yUtWC5nrkXdVr//b7sWnuoJihlKc0j+9qoxI5y1lIIEidWur9i5
	lhMCsDqKK0xXRvhrS08A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3NG-00EbHJ-DJ; Fri, 18 Feb 2022 13:32:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nx-00ELdL-01; Fri, 18 Feb 2022 12:56:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D26C11F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188967;
 bh=3cKLFODejquWIHPYAw3eHu3koF0olH3bhXMFQxUCMeQ=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=YdaWjvljX5wM0iuL780yoYpWHTPyevhyjVgBu76atMBDyWcbWJVZTtPzY8yDDlkDZ
 8EcEtPwi7F5UdHZAlX1azsI4QR4etvV5Kanoj6hCs2jN0ExRhFZoxJFbgoAE2hp8pK
 MQpmHExBri4qZpL9DNV2ylRafTjwkCeeWd3IUkTobMFrJv3la+aYNLQ0LNJu2dowOV
 1FsVmOIGiJJNI8RVba7QBLbFW0zBYF82hi5MZ9o/6ZWG3SjbZJCEh8EGI9r+tZQ37Y
 lEJ+h5HMQOedCvwasrPbewyHE2aqsOavBOJ7jHrjmCWMGEcIV4f0l3NaRr8pdUwvj5
 iE9pID0eBecAg==
Message-ID: <8b87bbc1-d6b2-a98f-ee02-a7ac57c5607e@collabora.com>
Date: Fri, 18 Feb 2022 13:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 16/23] arm64: dts: mt8192: Add H264 venc device node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-17-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-17-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045609_250891_3F2E5DC4 
X-CRM114-Status: UNSURE (   6.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Adds H264 venc node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
