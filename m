Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43523C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 07:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8BI8zbvN3nejOqXZK27MH2GF+7c3rgEng8DSaSZ3rU=; b=YFvkhaOYZ6Bt6uC1q5eC5VGzsK
	zYUAc56Vbkp+hjroaVVIZA8jLoctgDjC/l+CB/EXTKPtAckjSC0Wegg1omp2PbyaetUKVT8rX9F+B
	0avetQInpjlfAnIht2t93L7tIngniSgZzG18uuDybjJ+e/DsB9gKJxJh9QG4BGOPeLQcop7SIcINA
	IbQOuWO/hlSB5oencqYBJymeJPwuKXx6oS4GUAb2g5uQaifcaB4Gw0G0E+qOiopR02h+G0X2mr9T1
	nXp04s7hbodrtDv4gTfXAw7wDQQGs+hiOoHIb9EACWSVGChaU2ajqq08xdCPx9cE158fWne2dNGvv
	5qBCLjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iKT-00000005W7L-3tYL;
	Tue, 30 Apr 2024 07:55:09 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1iKQ-00000005W6N-2BZo;
	Tue, 30 Apr 2024 07:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714463703;
	bh=8fd3Zf+naCTjmhQ3xQuFpF0PXk4JsJpqWBdd7CpeZc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yoRtP+v/6mLobuxfLCx60w9BXuGCZUu3LAWDSAppJ8Z7FESOJhnnh5VZPcmVAHDu7
	 m4F+wylf5VSKzC8CEHjardDRMDqtxYIBBqX8of1Ifj+2rCDtSKGMBAXDJInYIzVieV
	 0t0rrah4NyrBPbscpp2IDANeGujMm3Q9IH0O3fh9KaxB0vQD2hmWtTjXKuGToAh6Am
	 G14BkrUJyGxRVZkC25VLbQ5vjbKzrg3ro70Ui/3tHhGWJ3LQeBkXpJoSuN5l9k9mZK
	 wlnrDeqRNwp1tCnyeBtSRYRdKliKQIDjl61fdBCVdVe23jGBsWnFh5RGEv2ph/dZ1M
	 Lfh680HMx2Vsg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E7B6F3781107;
	Tue, 30 Apr 2024 07:55:02 +0000 (UTC)
Message-ID: <2a683392-9fda-4da9-9bf5-ffa2b982634c@collabora.com>
Date: Tue, 30 Apr 2024 09:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 Device Tree fixes for v6.9
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
 <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <dc4975fa-82ae-4b2b-94f2-c518595f8694@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_005506_784402_8455B9A3 
X-CRM114-Status: GOOD (  12.81  )
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

Il 30/04/24 08:40, Arnd Bergmann ha scritto:
> On Tue, Apr 23, 2024, at 12:28, AngeloGioacchino Del Regno wrote:
>> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
>>
>>    Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
>>
>> are available in the Git repository at:
>>
>>    
>> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/
>> tags/mtk-dts64-fixes-for-v6.9
> 
> Just FYI, these were both merged into v6.9-rc6, but you got
> no automated notification because I had to merge them manually
> into the arm/fixes branch.
> 
> The problem here was the ssh://git@gitolite.k.o/ address, which
> does not get picked up by the automated tooling, and I see your
> later pull requests have the correct https:// address instead.
> 
>       Arnd

Yeah, I have to fix my stuff to stop generating the gitolite address when
preparing the pull requests.

I actually change the address manually before sending, which is suboptimal
and apparently prone to that mistake (-> forgetting to change it).

Btw, thank you! :-)

Cheers,
Angelo

