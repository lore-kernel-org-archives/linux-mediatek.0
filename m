Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B047FC43602
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=; b=Ub6S39buJwBgiVLqbUyKQGjsWM
	fLrfeMXOiiJSxp/+RghsSYujKrxtu7HCKNxCemG2VhnK8nDvr2vN9p5WjDrz7enbJ3v0Cezm4IgF4
	PwtwhwYC3zUFz/PIxlaGXUz3BFHewZFma3OMcFuPQYz4E8awJpX2yxlZXMNVGaxaBMOM0B1IyTxrf
	//xANNrBcvW8rxP4s14WLcPjffiD1FUeGUxfRAzK9N9ZzHUdjkhFWDEhRQ5cRmUB5nth6cW6VyUZK
	k26pXRHP1mMxYFhG5SAzIVLvMaV7f8IpleCThgaU+vxTIfZtkPR8N3ydLsuMYl4jHKT6SttMuUaii
	+LCAIAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMY-0000000Cu3g-2whO;
	Mon, 06 Jul 2026 15:36:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglMU-0000000Cu1t-00Em
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=;
	b=HMZjKuZdQf/VDbCwCp1H3hTIsm2yMXYXBBHFRmEgUtjBnU4nQyszU5j9mp4dhwjnFdo3tr
	s0vWnnbXze8+1kjRqtBbzScl098iFGfhJ+hIAqjThBfzY/xfIfbXql5IbqZePifDKIJeW6
	o8UsFBvDmBfvEvYdo+4SzsXSapH292E=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-BPTkVbJYOMCICPs4Sg7kPw-1; Mon, 06 Jul 2026 11:35:56 -0400
X-MC-Unique: BPTkVbJYOMCICPs4Sg7kPw-1
X-Mimecast-MFC-AGG-ID: BPTkVbJYOMCICPs4Sg7kPw_1783352155
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6a2f5995so527567785a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352155; x=1783956955;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hxinGIhcu4WQR6Nqj/llYdJ3OsXvQAMFrn41RWNE9p4=;
        b=BWVw1yIsNCAM3JeigDVbCSDM6u0cJOtIty/gFdsnI4JkNE+PqJeC47IHm0jpLYuQxi
         F0Bg7R9IkiO5fQisxTjtqFNjmednV4w+lHTFf6vr78AePHh9jzlrDjsfuvuz4xme/lZE
         naY8B8zAxS4jIaH5dqBUDZ2aAHK6EF6SQAH6BbVYPXlnUXPFZ/QV1agvwYVx4VIG9g0z
         uzbUhhpvXT3V/wZSZPRwVJNG+tWGt33OU3zNVCQIGbSd5u1Bn8+Zk5xOCW8FatJ6VM6F
         gMvjBNIJdMlI7zQL+mBXCIhgPYHcSkAqUzt6BZGWWhH0xGH0RbsA/+RWPd4pEt73LQY8
         lJDg==
X-Forwarded-Encrypted: i=1; AHgh+RoxgAy3MpltTXmT/ZaES+orw7TbHNVryBu9cvxUHXsydYBp4ole1OQfQ5kx9ET121k7hgXU+QbAGFjRwNBvWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YybQBzSGUSaEDGt27sfckdC69vuKQK3CgjlkSzbY/OChrILlChB
	+av5kHcRaX90CNfLSao+dcdJ3SS5xAT62YcuaxrvK1gZK0TW0jZhGpixZcQpXkW8Pq0bnE7lGRd
	HNBlnW4pdgMOVcoUZB7HkMVi2ONVR9bLADuy4XfXm3gmOFuBkKzmNpMBxQulxaqlENMmANnTuLw
	==
X-Gm-Gg: AfdE7cmbmUibu65Qs4LmUZ1GDW7OmJZp1SSnKbnQnUnNkyktdLx/ibD733SMKAJd/kl
	Zsh2y6Bp4prr0HHOg35OJw+MFOahR8rwIX0pZN5r4ytDj8PYS9lZSh65ihSFABtkpgX6sCqFP8U
	1jvp2rtYVqH2ZtvEVLVbg28c+fPP4dPdwV0COLV0D8YThIgLIUePDMxdJV0kzvEvaDKDlRg7S4y
	C7nFouA+9jKVX7LXqCpPfqQyKQDxnNrfCBYjTwR5EUQ5Py3oRWVVEnkpY3QysgPOLmVp0DvXbFh
	zrMpxi4BgEh27JTWI1B05OTmF/rvXH7xTN4JTe7kLV1CcKJjLGPrRlqA8TvVfH78ADIhd5lf1sR
	oDpNB5Eohl1jYmlfLZMvGRUN9aLLzM0FtIbRGa9mNFzSMPw==
X-Received: by 2002:a05:620a:4606:b0:915:afa5:725 with SMTP id af79cd13be357-92ebb4b48d2mr159857685a.6.1783352154832;
        Mon, 06 Jul 2026 08:35:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4606:b0:915:afa5:725 with SMTP id af79cd13be357-92ebb4b48d2mr159850985a.6.1783352154257;
        Mon, 06 Jul 2026 08:35:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800fasm939411685a.6.2026.07.06.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:35:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 11:35:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: mt6735-vencsys: add missing
 MODULE_DEVICE_TABLE()
Message-ID: <akvLV114MsiXu7Wf@redhat.com>
References: <20260704124808.19916-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260704124808.19916-1-pengpeng@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kh8qZFr93rrXimdwEPq-24szmzI0R3hpJjpThcT9_UY_1783352155
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_083558_543142_FDDD8A71 
X-CRM114-Status: GOOD (  11.37  )
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

On Sat, Jul 04, 2026 at 08:48:08PM +0800, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>


