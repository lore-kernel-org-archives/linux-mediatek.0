Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A042C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUw1SKgmWw5ORSAiR/36Yj9L3Y1k8+bSXT3+XT5yssw=; b=lq03TG3N+6G9Nbd5429EaQhG+9
	kmKSi9KTqiHt7hnfzINO+eMnnBqB0jdlirpBOK9z89486MfDa1XZ/fx6D/xfN0BaW8wW4wzzThEyW
	S9CpZ4mAzH5mbEDY0XalWRVXhCLQjAqMDlavNaKN9bK1g59j/KcAvRFRUgZ9bMIZT8/0fe3uf60e6
	S7RHDpimZ5sTNCcBnM3l2tXgfrIgsJfZQmM7uco+aSKO0M8Plr75/a4NdaVh1BMz3sHtjuQbQ0lis
	7QmOQ67mFTBBw/4AOqrT3mSU3AkoW+sgB+FUsZtLRJ+OFHD8tXkSu0C8MIR/hNyqO9yN0rnyiKbPW
	jbKKe/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSjI-000000090GB-0P8L;
	Wed, 27 Mar 2024 12:50:08 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSjE-000000090CS-1Me7;
	Wed, 27 Mar 2024 12:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711543799;
	bh=ABclRLb/R2quz1tOh/euCSegn/zdsYmPz6ReeOO+m9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BiKre3OppgksMn0qvlTpqn8PN0VPd9qAcm+ZlikA9ppXxvpgRiGG2jIaEq3ZXdZyJ
	 LchSpMT/XOSWQj/OuZb07xVg0mdSi1CpU4HIXgbPIpUMG7ZjJG7vXlWEVwBvhQcR/k
	 pPZ7g04SXUECZgRkNqMRRKkJ3bcWuQ+bMomk6kgyVcfJFBsJg0fmm9tbqrmSnrb5Pw
	 zWlVrLfq+IikZG1mwpDiVAP0tWrihYvHlk4My5pvGEYHbI3xDvk+Hnls9VfdEiz2Bd
	 /ZiLlRTNWNKhxlIKhOjnwZKRyPzcpCLm07y0MEklL605qdgVw+IMGDhZPyNEIPE/+W
	 FA/Crc/1Czv4g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B2BF237811CD;
	Wed, 27 Mar 2024 12:49:58 +0000 (UTC)
Message-ID: <9ef4e974-740e-4698-bb38-f236521a425c@collabora.com>
Date: Wed, 27 Mar 2024 13:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: mediatek: Don't parse extraneous subnodes
 for multi-core
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, matthias.bgg@gmail.com, tzungbi@kernel.org,
 tinghan.shen@mediatek.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, kernel@collabora.com
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-3-angelogioacchino.delregno@collabora.com>
 <ZfxRyMyUqyqtXy8n@p14s>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ZfxRyMyUqyqtXy8n@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_055004_590822_167AFA6C 
X-CRM114-Status: GOOD (  19.16  )
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

Il 21/03/24 16:27, Mathieu Poirier ha scritto:
> On Thu, Mar 21, 2024 at 09:46:14AM +0100, AngeloGioacchino Del Regno wrote:
>> When probing multi-core SCP, this driver is parsing all sub-nodes of
>> the scp-cluster node, but one of those could be not an actual SCP core
>> and that would make the entire SCP cluster to fail probing for no good
>> reason.
>>
>> To fix that, in scp_add_multi_core() treat a subnode as a SCP Core by
>> parsing only available subnodes having compatible "mediatek,scp-core".
>>
>> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/remoteproc/mtk_scp.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
>> index 67518291a8ad..fbe1c232dae7 100644
>> --- a/drivers/remoteproc/mtk_scp.c
>> +++ b/drivers/remoteproc/mtk_scp.c
>> @@ -1096,6 +1096,9 @@ static int scp_add_multi_core(struct platform_device *pdev,
>>   	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>>   
>>   	for_each_available_child_of_node(np, child) {
>> +		if (!of_device_is_compatible(child, "mediatek,scp-core"))
>> +			continue;
>> +
> 
> Interesting - what else gets stashed under the remote processor node?  I don't
> see anything specified in the bindings.
> 

Sorry for the late reply - well, in this precise moment in time, upstream,
nothing yet.

I have noticed this while debugging some lockups and wanted to move the scp_adsp
clock controller node as child of the SCP node (as some of those clocks are located
*into the SCP's CFG register space*, and it's correct for that to be a child as one
of those do depend on the SCP being up - and I'll spare you the rest) and noticed
the unexpected behavior, as the SCP driver was treating those as an SCP core.

There was no kernel panic, but the SCP would fail probing.

This is anyway a missed requirement ... for platforms that want *both* two SCP
cores *and* the AudioDSP, as that'd at least be two nodes with the same iostart
(scp@1072000, clock-controller@1072000), other than the reasons I explained some
lines back.

...and that's why this commit was sent :-)

P.S.: The reason why platforms don't crash without the scp_adsp clock controller
       as a child of SCP is that the bootloader is actually doing basic init for
       the SCP, hence the block is powered on when booting ;-)

Cheers,
Angelo

> Thanks,
> Mathieu
> 
>>   		if (!cluster_of_data[core_id]) {
>>   			ret = -EINVAL;
>>   			dev_err(dev, "Not support core %d\n", core_id);
>> -- 
>> 2.44.0
>>



