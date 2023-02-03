Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2DCC05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkZNVI0ooDKoPnq0Hu5IgECdOoB1rtGfIO0M/9kp1Q0=; b=tiyzA2mwj7rFaiViZQyxIa6kfG
	WlKtZs//nfgVSVlu/FNqx6cTXbKCBZBpSJjMGWzvMiRFNcy2Z0oPQzerl/iDvTxZdmqoWNIy5gByG
	UEqaSYdKGa+i3KGPgClVa60EAm1EItuyjpO+L2Bm9oL1tEFH723zNh3xBdVbDvCWUPglhiTNyZJ5Q
	n0r9tlIWwWZO6yKoaiyPgh0ufwKEQ2P3qrW9FD+aMps0u+MSwze/JAnDRSWLFIiI36Hdg4Z1hdVPs
	pjOnJlXuFUe9dgYf8NO9csmZTq7cGqKTEwqWC/y1U279B/h2awaqntJBl/3IJFURtB+E22rsVZQRT
	e5tVdJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvFL-001mkv-J0; Fri, 03 Feb 2023 12:32:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNvF5-001mYT-Sx; Fri, 03 Feb 2023 12:32:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D2A0B82A83;
	Fri,  3 Feb 2023 12:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795C9C43444;
	Fri,  3 Feb 2023 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675427552;
	bh=iJge+MFqjbzizxQCThk6ckFPnVqDT96ToH0Ft3Tw/hQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cb+FiVf/u22D5ODmDsgmYB8x4z6jjnH3mAnoWdFnxki4XJTKMQBiz5uhRsfODBXgO
	 GeWrObErqwhYm49IJTiu1MgdZYxii+TaVIiN8buzRpT9pi7nOe0w4hjd/fEOjTLxBG
	 kmpHBUVtAleOKUDYGP/4Xg4PCozDxNijxu7qVKxB2iRWgH0793gRrJ0kilVEo6gKsq
	 5QT0ueotzjpqQAgBvq5DhuXquHQW4S+yg7TzAi0/snNwmXlQNQl1xyVsdABEIkeF6e
	 vYxsCnMJxuoYKab+IinW/T9AsopCmSgayyZwwmpJ1nPZBlIocNuAmYn2oKahxX1Rze
	 UYNiOt6C2cX0g==
Message-ID: <9c2c0e88-41d8-f9ec-d934-2d1752696b1a@kernel.org>
Date: Fri, 3 Feb 2023 13:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] dt-bindings: PCI: mediatek-gen3: Add support for
 controlling power and reset
Content-Language: en-US
To: =?UTF-8?B?SmlhbiBZYW5nICjmnajmiKwp?= <Jian.Yang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>,
 "kw@linux.com" <kw@linux.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 Ryder Lee <Ryder.Lee@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlleXkgWWFuZyAo5p2o5rSBKQ==?= <Jieyy.Yang@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?Q2h1YW5qaWEgTGl1ICjmn7PkvKDlmIkp?= <Chuanjia.Liu@mediatek.com>,
 =?UTF-8?B?UWl6aG9uZyBDaGVuZyAo56iL5ZWf5b+gKQ==?=
 <Qizhong.Cheng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 =?UTF-8?B?RGF2aWQtWUggQ2hpdSAo6YKx6Yi657+UKQ==?= <David-YH.Chiu@mediatek.com>
References: <20230111032830.20447-1-jian.yang@mediatek.com>
 <20230111032830.20447-3-jian.yang@mediatek.com>
 <dccfa004-1d40-acc0-6220-9232193b648f@kernel.org>
 <8d954de7f9507099bd9bea6801f446f80bd832aa.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <8d954de7f9507099bd9bea6801f446f80bd832aa.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_043236_241915_3391B0C3 
X-CRM114-Status: GOOD (  14.63  )
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

On 03/02/2023 10:38, Jian Yang (杨戬) wrote:
>>> +  pcie12v-supply:
>>> +    description:
>>> +      The regulator phandle that provides 12V power to downstream
>>> component.
>>> +
>>> +  dsc-reset-gpios:
>>> +    description:
>>> +      The reset GPIO of a downstream component.
>>
>> Why you cannot use standard reset-gpios property?
> 
> The "dsc-reset-gpios" represents an extra reset pin other than PERST#
> required by a PCIe downstream device. But the "reset-gpios", described
> in "pci.txt", represents the PERST#. So I tend to add a new property to
> meet this requirement.

OK

>>
>>> +    description:
>>> +      The delay time between assertion and de-assertion of a
>>> downstream
>>> +      component's reset GPIO.
>>
>> Why this should be a property of DT?
> 
> Same as the reason I described above. I suppose we need to add a
> property to let user determine the delay time due to differences
> in requirements between various devices.

No, I don't think we want individual properties like that. There is
ongoing discussion about this:
https://lore.kernel.org/all/20221214095342.937303-1-alexander.stein@ew.tq-group.com/

Feedback is welcomed - there. Don't create your own half-baked delays
for different hardware designs.

Best regards,
Krzysztof


