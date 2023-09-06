Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07E9EB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 05:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLdnZrikvRqAZVjfoZXl83CyqH4iEUEwVuhhnebGNn0=; b=Ay6nB90mZ/mQJQ7cY+9Vg9nkGP
	4DfPBawN92RJjhU1qV/fFyTV07ozF6gq6+5obWg/cvfGTssmtcKYUSgT4TV/jQ50dWnIqRw2u4F70
	Trm1wTBG1eSPQyZ3CndknlpmSwsJu7a6B9bIFFHrIWImClaUi/SbFE+UV77BD27s/YTzAFo4SJqyB
	O+jer5t+W/O4Yt/OqMaV5gDfQRn5/m2E6fdTvkwsJKTYBZ5tbij8euNsc5r6lz/USGBmE6QupjtRQ
	CFzUX4BqiIcFAJtvJqB0TcJsj2HeKaCD2SnuDeHuMoTxOFxCyLV4tVx/QXvymVwOocIgTClVt1QnP
	6Oz3D3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkpR-007HNP-0k;
	Wed, 06 Sep 2023 05:11:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkpO-007HMJ-2Z
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 05:11:48 +0000
Received: from [192.168.1.23] (unknown [171.76.82.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AF446606EE0;
	Wed,  6 Sep 2023 06:11:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693977103;
	bh=fBJ3Kvxa7kDKwh6Ep4cHrxUMmOzW8yApsuqM6ao47lM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Rw2OLms0VnNCk29BxEi3Hq+Ws4UWpvLBZXwBJvgde8cFJM6Wvje1/Wa6UvWYnjQTR
	 xkU9U+z7pLLUQAAgREx4eWlMfUkJZ61a/g6gqHpyMgj1CBq234EsopA1kQVGBTycIP
	 UE/maCTN9z4BZI47yTVosrV92BxO5j059+Kv50M49tOvrZ7wtqJzJ7xS9JV0O/vTwr
	 ReJSR0RYkQbnxRcDXO/mqt0iHLeOnjNWHMXeV7TuNX4NfcJM/BWBBbrGey/B1tzJft
	 kxQ3/YWB7z+WLmqBh1fPC+IMr7+Jt6lLddXHDkeU2g1Aru95rLiubscoFGmP+wLFGW
	 OsWEwwGTcPq+w==
Message-ID: <2bbce9cd-8b0d-6021-639b-8198620d7a99@collabora.com>
Date: Wed, 6 Sep 2023 10:41:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, helen.koike@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, emma@anholt.net, robclark@freedesktop.org,
 robdclark@google.com, anholt@google.com, robdclark@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
 <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
 <CAA8EJpoGoopP64T1nm1ye1ukTwT=u+LYY1ubQG-9dQ-j41iHiA@mail.gmail.com>
 <6be5f5d8-8940-c79b-4a01-3f3d73641e4e@collabora.com>
 <ktikqf5hu2dmqb4p7dvrqv2tjm565qn3qu2gggrvncfu47l23j@o6t2rnpbya3x>
 <427ceb32-054f-41ff-df95-446b18aa178f@collabora.com>
 <6uusq7jlofbztz34yksxbr6vgqq35a3x7ibuqm62dyrpzve4g5@boaladlcrjnv>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <6uusq7jlofbztz34yksxbr6vgqq35a3x7ibuqm62dyrpzve4g5@boaladlcrjnv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_221147_019866_6245CA24 
X-CRM114-Status: GOOD (  11.85  )
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

Hi Maxime,

On 05/09/23 19:10, Maxime Ripard wrote:
>> With,
>> &usb {
>> 	dr_mode = "host";
>> };
>>
>> The target is <0xffffffff> and fdtoverlay fails to apply the dtbo.
> 
> You do have /plugin/ and have compiled the base device tree with overlay
> support, right?

After compiling base dtbs with overlay support (make DTC_FLAGS=-@ dtbs) 
it works.

> 
>> With,
>> &{/soc@0/usb} {
>>           dr_mode = "host";
>> };
>>
>> The target-path is "/soc@0/usb" (usb: usb@78d9000)
> 
> Right, and that's not the path you want to modify. The path you want to
> modify is /soc@0/usb@78d9000. usb is the label, it's absolute, and you
> can't mix and match a path ("/soc@0/") and a label ("usb")

Thanks for the clarification.

Regards,
Vignesh


