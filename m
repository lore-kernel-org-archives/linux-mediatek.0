Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4624CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 08:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d5FRRY9IFv7oEJpNat7edsUPN15m0rq9AKNjoLPw/E=; b=1kV/hW2m/DjRVECKZX9gbom8jI
	IGZi52CqpEHmW/I4xPszdo788/jQzHVETgWFNPVHop+DcDT9POhz6M59fD/NUEBlqVJWOK+/6ZwKF
	QFu/f/G7CWpYyzj8DM+PxP57jv9HvEw3BmAfolbWlzwJ/rx4/GoyRyy2VvDdvhlkMZWq/LnamMkGF
	598o8X96WPm7R+18uYPvF9sm5d1PgmFbQ9O+EX7xWbxns9z6oKwykRv40MysaGagJbQ00BdhxkVeU
	M7C96k4NvSVuGYrmxO4MpU4AZvoVGhCFpYepffKUWnhZNcdc28jtBNcpH+5O0l65Dtgt1ePgj/5wv
	kp9ijiQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCy5D-00B3Ox-0P;
	Tue, 12 Dec 2023 08:25:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCy59-00B3OX-1D
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 08:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 098C96162C;
	Tue, 12 Dec 2023 08:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D72DC433C7;
	Tue, 12 Dec 2023 08:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702369533;
	bh=UyrCZ5NeqkIbDqZ4IfzKB2v4FwYYwyufuxet/S+xQZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y0tTobdaLmy4VCh/NwI9a3Snubd38cOqAeFoPopo7s4MuUU8zj92krFHmnPOxV22x
	 gpap/U1YH6sUfKArJWBVkst/TOgQIYPkRkI1wKdzDCUWhPBIZN+Lj+WfWr85YYx5z9
	 urcYYae/Sc5eiRb35t0jXR6xHCqsAW/yosWauCtE=
Date: Tue, 12 Dec 2023 09:25:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: justin.chen@broadcom.com, alcooperx@gmail.com,
	chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] usb: fix comment typos
Message-ID: <2023121249-swan-steep-dc94@gregkh>
References: <20231212074557.3100489-1-shitao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212074557.3100489-1-shitao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_002535_505831_95B55F0C 
X-CRM114-Status: UNSURE (   5.36  )
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

What is this?  It needs to be documented better, sorry.

thanks,

greg k-h

