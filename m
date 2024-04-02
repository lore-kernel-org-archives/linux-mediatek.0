Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE66C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 03:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdEV36OYqhfJhCJJLd5ThlK8EcnpX/S7YsoXCp2ZC1o=; b=NNStE5Zv5UfmEoqJZVBSyu+w20
	ZwPGDSFdXq9ALa4DQfhF6h2ZxNt9iCmER0hYL9SriS+uRaz3k1BpkwXLYBp46KTb1R/qAX4fK181i
	NDLkhiGHwKsMnSOPzpP8hliYmfnNvn1akv9aDGyTTLLExlDlu9i5bjWPjIuUfZqt35QeX/vLdraj8
	9A3OMwFjTVedlunqgXcxZEO7WXTVWOWKl0rXKdBhhIOdXXPqmzNd7psCBR9ovGJJjMvk0doKfY7eA
	kpTo9+goYZO9Nu1rbSEyZjk9cmOQUD4gdcDXLbPm44gxTRMPKWSfUFgSohR3uv9uPvWYJe80mtR8F
	KzRiDLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUzj-00000009b4M-2Sme;
	Tue, 02 Apr 2024 03:39:31 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrUzg-00000009b3x-1FZy
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 03:39:29 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 5730021C64;
	Mon,  1 Apr 2024 23:39:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:in-reply-to:message-id:references:mime-version
	:content-type; s=sasl; bh=wdEV36OYqhfJhCJJLd5ThlK8EcnpX/S7YsoXCp
	2ZC1o=; b=KAJr+KJl8jsjRCtvLAt4upb2p+BNypV2Pmp5Cxtk1j0xUvFZ8XdboC
	xBK10keQIJGfwqpf8Ls/pZAHkUluyP3wU/0ND1EV4ielspfiKZ6nVs3AOBbgwS+Q
	FrkLAzXjWB1Jyub1Wev6yuLC7EdF2U6XqriKQVYj/NaH8nJXBy5os=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 50E6721C63;
	Mon,  1 Apr 2024 23:39:27 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=wdEV36OYqhfJhCJJLd5ThlK8EcnpX/S7YsoXCp2ZC1o=; b=OkI/ZIuDRHJtVLRcvG6HVa+YB2HXoiUFZu7ovOxilA+bFOBTF2qWemKhOTj7BEISmPTeLfdt51Me9UabeMeX8G8/eCJdZpki68W+AuJZEvfibKacGdgXatR+eL8o3rjoAN4bFMPOsO9yQOU/l8ZZALKJtDAficaAvLNKG2ZFNAQ=
Received: from yoda.fluxnic.net (unknown [24.201.101.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 3B43E21C61;
	Mon,  1 Apr 2024 23:39:23 -0400 (EDT)
	(envelope-from nico@fluxnic.net)
Received: from xanadu (unknown [IPv6:fd17:d3d3:663b:0:9696:df8a:e3:af35])
	by yoda.fluxnic.net (Postfix) with ESMTPSA id 3409FC1CF05;
	Mon,  1 Apr 2024 23:31:49 -0400 (EDT)
Date: Mon, 1 Apr 2024 23:31:49 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
    linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 00/15] Mediatek thermal sensor driver support for
 MT8186 and MT8188
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
Message-ID: <84sp6nnp-2ppp-s388-7290-49p996n6n969@syhkavp.arg>
References: <20240402032729.2736685-1-nico@fluxnic.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 98B70D10-F0A2-11EE-A267-A19503B9AAD1-78420484!pb-smtp21.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_203928_511203_653E7C7E 
X-CRM114-Status: UNSURE (   9.34  )
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

On Mon, 1 Apr 2024, Nicolas Pitre wrote:

> This is a bunch of patches to support the MT8186 and MT8188 thermal
> sensor configurations.

They were tagged "v2" despite being "v3". Please follow the thread.


Nicolas

