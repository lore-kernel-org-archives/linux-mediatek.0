Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9C6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ+XCQSJHoBMZ+8C2mE8EEAn+OyDfgMrRhV+w64s4Zk=; b=GPP7IuKS+UuLljCmV8u8UOkJ3I
	DjVVVb4gvqPs839obrQ9UCxbUEqorc5DEhBFlKftO1PL93RfW052fdH9p5GSGfI8/UWR7CV2nqrHa
	2nE/m4cAIL6jKzQokf+mL+1331RltU7ALxE6JvutG8WZM06PLgDHjG5KthGpdjBoAQsyhC3S0L6k0
	HVPhVN8MNQXM148/Ruc4aVqp4QVaQIZym3mBn57/Abfog05vakVhJODTRIl9yRSdW40T3KzCxwChI
	u9nvEkk4AjBtf9xkltoZezBTGZixzwL2U2TlmVEx5uYQxKWzDO/8rIEJOm8dXfxIRu89N7WRSL2jb
	sVY6hZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCy5U-00B3RI-0B;
	Tue, 12 Dec 2023 08:25:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCy5Q-00B3Qi-0B
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 08:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE369CE1316;
	Tue, 12 Dec 2023 08:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85825C433C9;
	Tue, 12 Dec 2023 08:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702369548;
	bh=3a9AxDt7rKdnQt1lB7x7eM9PZxjgwdVCfCxEm49JQi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ga8GfI4RYaUAlSj8fu+eIRYZS/vv75ipHwGI5bbnI4pXxIrSlsTzwVHl4zqa5cF0u
	 NtqxzH+P39uUeVJ9XrXiWb+8Vnh5+BmDbhh80sKcdyyjccCE5gBl0lxyuJCI5xo5zh
	 d2eombqosAAEVyS7L4d1kPhT8jKw68sc3vo3Pj7E=
Date: Tue, 12 Dec 2023 09:25:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: justin.chen@broadcom.com, alcooperx@gmail.com,
	chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] usb: fix comment typos
Message-ID: <2023121236-earful-email-ea09@gregkh>
References: <20231212074557.3100489-1-shitao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212074557.3100489-1-shitao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_002552_317014_7B34AACC 
X-CRM114-Status: UNSURE (   7.98  )
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

On Tue, Dec 12, 2023 at 03:45:57PM +0800, shitao wrote:
> Fix two comment typos in usb module files.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
>  drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
>  drivers/usb/mtu3/mtu3_qmu.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Also why isn't this two different patches?

thanks,

greg k-h

