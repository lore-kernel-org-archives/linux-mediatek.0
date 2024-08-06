Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66354C3DA64
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrE670yx+9odykcx3pr94NIhef7s04HUgnr8F28Op48=; b=ZsOwVLuA1Et1u6Yz97p7iIcKlf
	rJsTLrSeQpxXoBxWY9bFOa5MNtCBxE90xzM4auISx2PjOY2zMq2kCLWpBBFgH1UvS5nfIQaV81FJy
	4ln1Cx1eEa/3zmyyyvJ7I4pbYiDHiWScJhNtIeG1UzZZxqXrD6/RO+SaaVCx3HBt18OPRtELrSHRG
	o6If7gStVzGc34BYWGnR9ovdeHrZGbf3uV62r+aeWj00mfrrKBuT3vrjzOeelimx1UX0YtFe8PopC
	pI7nNfxYyGi+4L96MTJ85mscdbbtETs439C73oBHSINuMVExeKuRmxhnKkhanSQidtUaVjqNCsI1S
	4Qjdou4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFEb-00000000t22-0O2A;
	Tue, 06 Aug 2024 08:07:57 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFE3-00000000ssY-1SB3;
	Tue, 06 Aug 2024 08:07:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722931640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FBX9vhR+G7lHl4FudhYRBRVNw8pYIGZEC0olIX9FOaF3Me/MzJsBduEcGktCSNnioXZJM1HqrjFucWego2skit1v+tvnBhqRrSzzeskg4u9fOTkgS5X15hTM4KtYb1n6b5/ZrQdMFLt0bnUMuABQfTG0lIdThV8OkzfJIpv7sY4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722931640; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IrE670yx+9odykcx3pr94NIhef7s04HUgnr8F28Op48=; 
	b=EeP6szSJ4JNjbCW/4ES3dU6Us7gdD7U3UJDf+Pn2ifHP1Fd1/RaBUfVYH9B/s6UEKYfE7hgVbPE46Qwjwy+NubdMZ52zvWwcBjNmncxEMaGb1FbF1aF/xCiBRxeg65j3Fz3r3+iFbleyL9p4Hh5NPhR68/5+KFeZUyCakRwfOl8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722931640;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IrE670yx+9odykcx3pr94NIhef7s04HUgnr8F28Op48=;
	b=krVhWrDwSdW8K00uqR4WQD8aZN6kPLEVS9s7/MWpwjcN7YCE+OMkxuisnz9RhBA3
	kq1yDFpfnnFSy1sED6o1+YqZH0dZ/tO5KY3wRRwHJfDM0l5HpHXkYD0Iatajp6fX6/S
	PyHa7MqXzRnhZceEyo85UcWU4yqr7a65SvQwXGyI=
Received: by mx.zohomail.com with SMTPS id 1722931637559700.0955006196194;
	Tue, 6 Aug 2024 01:07:17 -0700 (PDT)
Message-ID: <b887b799-cd9c-441d-8b1f-cda24ad131de@collabora.com>
Date: Tue, 6 Aug 2024 10:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add kukui-jacuzzi-cerise and kukui-jacuzzi-stern
 DT and dt-binding
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240731-jacuzzi_dt-v3-0-1c4314e8962f@chromium.org>
 <172243932855.488108.1466847928167694223.b4-ty@collabora.com>
 <CAHc4DNLwUAzrE-1-7oH2DHR6fvz4x9ZVaKbjUo6rOy3-kjUadQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAHc4DNLwUAzrE-1-7oH2DHR6fvz4x9ZVaKbjUo6rOy3-kjUadQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_010723_461700_987B9865 
X-CRM114-Status: GOOD (  13.66  )
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

Il 06/08/24 07:05, Hsin-Te Yuan ha scritto:
> On Wed, Jul 31, 2024 at 11:22 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> On Wed, 31 Jul 2024 10:47:24 +0000, Hsin-Te Yuan wrote:
>>> Cerise is known as ASUS Chromebook CZ1.
>>> Stern is known as ASUS Chromebook Flip CZ1.
>>>
>>> They are almost identical. The only difference is that Cerise is a
>>> clamshell device without touchscreen and Stern is a convertible device.
>>>
>>>
>>> [...]
>>
>> Applied to v6.11-next/dts64, thanks!
>>
>> [1/2] arm64: dts: mt8183: Add kukui-jacuzzi-cerise series boards
>>        commit: 4ba6d1539fdd709ea8e8478c37b014e663cd6894
>> [2/2] dt-bindings: arm64: mediatek: Add kukui-jacuzzi-cerise board
>>        commit: ac90896833b52ff58c81727f57ed3cf9ffb9db86
>>
>> Cheers,
>> Angelo
>>
>>
> I'm sorry that I just found out these two devices will not be
> launched. I sincerely apologize for any inconvenience this may cause
> and for taking up your valuable time. I kindly request that you
> consider dropping this patch series.
> 
> Sincerely,
> Hsin-Te

It's okay, the commits weren't deep in the MediaTek trees, so I was able
to drop them in a jiffy.

Thank you!
Angelo


