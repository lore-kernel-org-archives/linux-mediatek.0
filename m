Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF0EECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eB+3aQ3kL1UWfYUID7xX798KfUmuc+e8SZ1pQzIJZMQ=; b=BRX3Ud8FezQrgrSmD0153G6zSP
	Szu55Q/sHq53/hjPkMMpjhGpBHf7GxFD4Go3lweJgpn/EYalReyVWPn3/bH8iZmhgnsXBJ1d/8SSp
	NLB4qhTo9GEGUguMLGxNiFr/zZ4vpPWwMDN+ikyC04BvNUcKBQJHxvtodxTuZtUcGVpDyDrKOwlmT
	UrcdXC5+6k0PWQW8Jj82NTZpMgbNgk0EX/uYWmISxDZKzrJpX9bX6zJt7WeNmErMfavJENt8pk0eB
	x6gHn9+itML4/06tS3zzYOSE2nSguzZGZvlWx6kFn6Uct+4WksLssHpVpojsfV9FwxIzzLFniacbN
	zWrAOjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbAX-006moG-0U; Mon, 29 Aug 2022 09:34:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSb93-006ln5-MP; Mon, 29 Aug 2022 09:33:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BA496601DB2;
	Mon, 29 Aug 2022 10:33:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661765603;
	bh=TeeiT3sOJD7ti95kUOVN+hHl62A13KKzEUX5gr7qxoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bYFXlHfCvVW3d8M5OyGw5U34C40yYrQTineqrlNQhResTqgK8x1QOy66hNAkKka+I
	 Ce4pEa8FljcExBpHQlu0UzWag8PIgelGaquxFPg+ubuTAMptCH2oQYDnv2gPWI9ukt
	 qxDk+jlDmCaIIG8Glg4lWUJfB6oXSYl/un/ZM6vNRp76veV6Bg5ElmQ81PoUP9V97W
	 w8+tQt6OjwFY0VGjaegF6b1yKIp64dxfp3yNHRKtzyIOQORh3/VmZIQbGg8DY02MT8
	 dQxXc6cTH5aUc7hpQnKyqEbsDUaWLWlUZxQ1f6gQ/WrpnJr8ieMIQA2O0J+5cwcJCd
	 JB8bSI7w73KyA==
Message-ID: <5ef83611-1649-c86b-abd8-dff617993580@collabora.com>
Date: Mon, 29 Aug 2022 11:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 6/6] soc: mediatek: mtk-svs: Use bitfield access macros
 where possible
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-7-angelogioacchino.delregno@collabora.com>
 <fa5f9bc8-f087-02c6-dd31-efa33244bf1b@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <fa5f9bc8-f087-02c6-dd31-efa33244bf1b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_023325_936109_0D5543A4 
X-CRM114-Status: UNSURE (   9.71  )
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

Il 25/08/22 15:29, Matthias Brugger ha scritto:
> 
> 
> On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
>> In order to enhance readability and safety during registers setup
>> and value retrieval, redefine a few register related macros and
>> convert all open-coded instances of bitfield setting/retrieval
>> to use the FIELD_PREP() and FIELD_GET() macros.
>> While at it, some macros were renamed to further enhance readability.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Does not apply, would you mind to resend together with 1/6? Thanks!
> 

Hey Matthias,

thanks for picking the ones that applied cleanly in the meanwhile.

I'll rebase this and 1/6 as soon as I can!

Cheers,
Angelo

