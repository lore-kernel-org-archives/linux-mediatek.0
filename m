Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3D9C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 11:16:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C8D613D9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 11:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69C8D613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VOVZUgQCUq83fYxunr7eEiwLZTA+xDnYLziJ7vNzAbk=; b=lB30lJiE9QDNnCffPmXhTsX7z
	+NrDxcWe9567e9Zr0auBdf0pjLb+DOXc/2QNydQkoWOucznmPUhzWjzBdnrzioP20feOV8b/hPnV6
	aNX8b4Z3z6g6Y0jkIXP6weW5Cfya7qQF17oLR4szIA9hcUNGYJ2v3u0UO00TS9qXzSmn5kToJXdcJ
	k3TpoOpeba/8+plZizTvUSu0DRJsSYx4zPz4BU0OA6juCVQuhg+7Zw8gJJmnyxPC2AgCsb5O6Fkpw
	XWH5HIQhF5ykFu5Btcd7CDQIfMSE5sqN4puex090G3OVK/dEHuJOzTwGDP1XAMT1tNPFAYBiHEhLD
	Hj5iUPjUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc4eb-005XzS-CO; Thu, 29 Apr 2021 11:16:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc4eO-005Xxr-Uq; Thu, 29 Apr 2021 11:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=YrojQE9ERQiZNfb7RIe79VsZbxw01qfhdFXpj3i6hGo=; b=4YQlvL41bz/GD7oAVtynqdwuM7
 GuYFxwKYv7+bxWds9zAyRamDK9ep8blAtq1S9t402pf9fsX8b8QmYfh2BHwsXrIm+uSsPnoHIqBSw
 9rSD0cPLxzJisV3LfoDdC2MCikYhxT8UNk9rL9Bx/lnChnQsAkWLt3lyfm3Q090vbWRQmeZh/s9Hh
 CV5pci3KV3EqZODQgu+dRV5EKRIwV6TEQGpKZlUyGmwxgqPBIOj82FW6JoB+8yQ+VBO4N8AaYXDnR
 ypdMAaBTskcw8/NPyciYL8J3pH38YOw/oyJ2vy0ZyxW/q6Rsm9MLybuD02j+KeEOQMEp4vbvFos+g
 H5RZGJcA==;
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc4eL-000aOd-QI; Thu, 29 Apr 2021 11:16:07 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id c4eDlaqJQk1MGc4eHlQHFU; Thu, 29 Apr 2021 13:16:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1619694962; bh=YrojQE9ERQiZNfb7RIe79VsZbxw01qfhdFXpj3i6hGo=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=DHumpr44aBiQWb/UXwg5d1PH+wSzzQYZO1aj12K0q8l43CJ5Lcl87dEE3T4JnVD5/
 aIZSwVdGjryRoPBcW9EBxKUYjZuEvCSwhxKYP/ChX1qAcd/FuTIMNXlaGDKjYHD3vF
 pvRTY4D8OWvmzbeuCJDy9C/2tb/wDbzMBOjhUt20fpuP5I4X4mJRmPB8frvH6ZolB+
 I0o8PCFcnvGI08Y/QIjxRv4GtAhgL1hBmltgKGpSAK8gVzaybrcgWn4gC5R/kHV0ZL
 9YNVISsL4EVHug9iviScgXMZBgDJoMtPmq/rJvIlTn2MxkV4MwXtKMGlljVl/DaBWn
 HFJ/Ku8i1mQeA==
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
To: Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fritz Koenig <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-2-irui.wang@mediatek.com>
 <20210210225323.GA2961490@robh.at.kernel.org>
 <1614581129.14457.0.camel@mhfsdcap03>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2b97b41c-d5d8-ac32-a9cf-c7bef09ed8ef@xs4all.nl>
Date: Thu, 29 Apr 2021 13:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1614581129.14457.0.camel@mhfsdcap03>
Content-Language: en-US
X-CMAE-Envelope: MS4xfNrow+hJPzbDwnSzPIM2iA7/r7UP/AhJJatUskZ25uvvarllQW6GBPr2wazwYt9NN71N3GOTusnxmHuukAG4ZvotrrHOVv1QJzl+rOcQ51QRhCgUM1Qn
 M4Anh50GGMSX3hNWob2kxFFJsFPAt+QRqVAJoTwjo7smyyOLDcMJtGyaZ3TgMhtN9V6x+ebu/AQDYYpRyVjeAmaBRIs8OaBe6M3Ab0jMcfr/oGd3yqbFLsWq
 HAB7BJyvNa8uX2DVXaJ40NKBPLSSq9pShFG/Y88QJHXwJo2fQdBA3zT29ORmDgvVbXfP4I73uwejQ09AVB+xnIhm+RchvJ0zHMhP+7OhGw95BY2EeX7WpNk2
 lwkDpd//gfTKnAmrkm7w9Rhc0tidSRMyjq2gOdPGEkSen8s+9g2y+CHUAyGZIUBUOONXTPywleMtQr/7mgCu7NSR3qhyHlTr/WOOrAg5FF+KD9u5vnakyqa9
 Ng89ajdZgRZytq9Cs2obvrBfEVWcZtUQaQ0WU8khZ07re67MwdIcQU9MLMYDn6gfF6SCKbWSZRyMtwJ2mtcEbHF3XFJ9ika1R8Vjr0mLa4fcrl1y6AmZLyal
 l/W8Abl+tyKVObjfMUZdge6lgAIAH9pRUUVJo/qHo8RE4xfCtgF2H5vx2MFNfUVTkYLkaZdrqkN6wbPJB7iEu6FuhQpkR+e2tbeZHRxDk2oRu+bqOjhcC4f/
 5glUCzyJmy9H0WJ8wq4b9D963MgjdPedHi39frvMKOj4nih7X3vR3OdbBj8W7CVBSUAZKz28DHp1oYjFrbnI1cyos4GfvEy1rKm4vuGf53t6bDic+iyrfTYo
 ndwfDRFZZdYSu/jln5U=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_041606_033260_19D48E98 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Rob,

On 01/03/2021 07:45, Irui Wang wrote:
> On Wed, 2021-02-10 at 16:53 -0600, Rob Herring wrote:
>> On Wed, Feb 03, 2021 at 04:37:48PM +0800, Irui Wang wrote:
>>> Adds dma-ranges property for DMA addresses translation.
>>>
>>> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>>> index f85276e629bf..e4644f8caee9 100644
>>> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>>> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
>>> @@ -23,6 +23,8 @@ Required properties:
>>>  - iommus : should point to the respective IOMMU block with master port as
>>>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>>>    for details.
>>> +- dma-ranges : describes how the physical address space of the IOMMU maps
>>> +  to memory.
>>
>> dma-ranges is supposed to be in a bus/parent node.
> Dear Rob,
> 
> The mt8192 iommu support 0~16GB iova. We separate it to four banks:
> 0~4G; 4G~8G; 8G~12G; 12G~16G.
> 
> The "dma-ranges" could be used to adjust the bank we locate.
> If we don't set this property. The default range always is 0~4G.
> 
> Here we don't have actual bus/parent concept here.  And the iova
> requirement is for our HW. Thus put the property in our node.
> 
> Is this OK? If this is ok for you, I will put this message in the commit
> message and binding in next version.

Can you answer Irui's question? Just a reminder...

Much appreciated!

Regards,

	Hans

> 
> Regards
>>
>>>  One of the two following nodes:
>>>  - mediatek,vpu : the node of the video processor unit, if using VPU.
>>>  - mediatek,scp : the node of the SCP unit, if using SCP.
>>> -- 
>>> 2.25.1
>>>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
