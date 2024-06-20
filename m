Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20124C2BA18
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LT3YDUWs1AIcoYCC+yUNzJv8jIBvHZL4t0VEYPm1+XU=; b=QGKi+9+dn7ozj0ULz6e7FauMDp
	ktAGZvruJ2jTDE7M1Y9VnrWC+/O0R/Fs/Slkx78uJagUOKbC7ID7/bQ3ppkdeRPOdBfLSGl4r9xPe
	Xl9p/YmLqb8JxwgUtdUZwCObMgYGhBWgAu4Xjsu1JbOBnto+pKQW5OVvvfptDCwWCED4gPGpPe+SD
	Ex+Q5nb+Qy1hP0xdouMczn/HbDymkKmSF4QG3oogtxAD+43EZo8FtcVkPx6sO6TDS3+bYZfqdWsUo
	YiFTkJCHh65TkWtUfIInj3z0iOX2pz4jFs3EPwMomuqKQLdygP3OzArAliyWGkqG3iH0M2njsxkI0
	FZUDfpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDE9-00000004Ag0-25M5;
	Thu, 20 Jun 2024 08:33:05 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDDk-00000004ANT-29mI;
	Thu, 20 Jun 2024 08:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718872358;
	bh=kZP756ApMCbsWPF0yi0qrMXeSdEChDIUSSlFRUyfPx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m94fVAGCsmSi/o6TVENMyOEqnM63upOGVNIRWSaLxdveLfeD38e/3dwH3JxVowuNC
	 LihXaxoOcghFwfcLX+rWX9f7tm8RLtoS5hFz6RWtZRot/Bb8tNS/BkSXklJAkkEEvX
	 Pjfbt7NM49sO2VNTjUVi7qdP2fXSlVVJjkpQQ4IMt/rgAQCxXTjymx3Ya+dbSQZ4ia
	 +3ekd1Z5eytypiLJr13POcrBx4CubdXR/0DwxLnA5bVKLDJSD1XACQIgwCV/3tBhlc
	 rsTZGR+GuH5bNclWuqEg/2sbGuODI/LtoH2QYVgaQ62gnY+TmALeuK9k4Tw5NZj8hl
	 WfIy8RPIDBTXg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 93B9F37810CD;
	Thu, 20 Jun 2024 08:32:37 +0000 (UTC)
Message-ID: <c154527b-90c3-4834-a4a0-cff4524de5f1@collabora.com>
Date: Thu, 20 Jun 2024 10:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: mediatek: Avoid clock-names on
 MT8188 GCE
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, krzk+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, jassisinghbrar@gmail.com,
 garmin.chang@mediatek.com, houlong.wei@mediatek.com,
 Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, Elvis.Wang@mediatek.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
 <20240619085322.66716-3-angelogioacchino.delregno@collabora.com>
 <20240619-sleeve-citable-a3dc10e5cd4f@spud>
 <a7317981-8690-4d45-81b6-cc6a63c459e0@collabora.com>
 <20240620-district-bullring-c028e0183925@wendy>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240620-district-bullring-c028e0183925@wendy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_013240_846546_413BB2C7 
X-CRM114-Status: GOOD (  17.38  )
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

Il 20/06/24 10:22, Conor Dooley ha scritto:
> On Thu, Jun 20, 2024 at 10:01:18AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 19/06/24 19:49, Conor Dooley ha scritto:
>>> On Wed, Jun 19, 2024 at 10:53:22AM +0200, AngeloGioacchino Del Regno wrote:
>>>> Add mediatek,mt8188-gce to the list of compatibles for which the
>>>> clock-names property is not required.
>>>
>>> Because, I assume, it has some internal clock? Why do either of these
>>> things have no clock? Doesn't the internal logic require one?
>>>
>>
>> Because there's no gce0/gce1 clock, there's only an infracfg_AO clock that is
>> for one GCE instance, hence there's no need to require clock-names.
> 
> clock-names, d'oh. I misread that completely yesterday.
> 
>> I can't remove the clock-names requirement from the older compatibles though,
>> because the (sorry about this word) driver (eh..) gets the clock by name for
>> the single GCE SoCs...
>>
>> ...and here comes a self-NACK for this commit, I have to fix the driver and
>> then stop requiring clock-names on all compatibles, instead of having this
>> ugly nonsense.
> 
> Is it not worth keeping the clock names, even if ugly or w/e, because
> things have been done that way for a while?

It's worth allowing clock-names, but *requiring* that is unnecessary because
there is, and there will always be, only one clock...!

> Also, what does U-Boot do on these systems to get the clocks?
> 

U-Boot doesn't support GCE at all (no driver - at least upstream)...!

>> Self-note: gce0/gce1 clocks lookup was implemented in the driver but never
>> used and never added to the binding - luckily.
>>
>> Sorry Conor, I just acknowledged that there's a better way of doing that.
>>
>> Thank you for making me re-read this stuff, I'll send the proper changes
>> later today, driver change + binding change in a separate series.
>>
>> As for the other two commits in this series, completely unrelated to GCE,
>> those are still fine, and are fixing dtbs_check warnings.



