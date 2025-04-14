Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6E2C369A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7ebwvhuxkLT23uvP5KyVDea79rZSAmx7birmt8oZsE=; b=wtxlBqxkBMFJbXJa3CAezbRXvg
	CLe0/fYFN+c8zXSgz+KCcuueUzMzeYPZ0v0wIGy4hEzbNl63eyv9wSvx8B/DyakPouLL7t3St2+ku
	n9Vs8grY1dNMKtx22t2SeX3RMbUOEwh7wWRp//46DuyoNJnFcT9fLE1xajorrjTJ0Sd+iETHXz0sT
	eapO4kyFmjuyBxkxMYJA7HnJoO6iRj/4+HFoDOKKyBG2XO+MKeq7te7Gn30+WOTBeUhJMckUrkTWU
	yUmPYWG7iwpclj8ry8MKWKTlT9UaQRnggA9+r5oJts82Nf/gK9bh/T5sQl2NRfku7jnVdzhs8PMnY
	+NXW+K3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4N28-00000002qK5-2lra;
	Mon, 14 Apr 2025 16:51:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4N25-00000002qIH-1uzv
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Apr 2025 16:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744649497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ebwvhuxkLT23uvP5KyVDea79rZSAmx7birmt8oZsE=;
	b=N7HZo218pYguqBtOzBgcNiwJG/EMQ3hXorNjNMO9915Pg0iymq+hhloZhiQ8/ABLvP1k8u
	OlNtPUBgpvLoydJmVyDKAjYf9y1j/h09PWJTrwoDg0x175rGKv29UpxAbKuuJR0c7xhPyq
	Wzpd/FQVG/idE9NijRrzi14zco/DrWY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-185-xvASS7HDOU-Q63Z3wE66sg-1; Mon,
 14 Apr 2025 12:51:31 -0400
X-MC-Unique: xvASS7HDOU-Q63Z3wE66sg-1
X-Mimecast-MFC-AGG-ID: xvASS7HDOU-Q63Z3wE66sg_1744649486
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92099180AF6B;
	Mon, 14 Apr 2025 16:51:25 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.114])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2FD3419560AD;
	Mon, 14 Apr 2025 16:51:20 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 14 Apr 2025 18:50:49 +0200 (CEST)
Date: Mon, 14 Apr 2025 18:50:44 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Tze-nan Wu =?utf-8?B?KOWQs+a+pOWNlyk=?= <Tze-nan.Wu@mediatek.com>
Cc: Bobule Chang =?utf-8?B?KOW8teW8mOe+qSk=?= <bobule.chang@mediatek.com>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chenqiwu@xiaomi.com" <chenqiwu@xiaomi.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [RFC PATCH] exit: Skip panic in do_exit() during poweroff
Message-ID: <20250414165043.GG28345@redhat.com>
References: <20250410143937.1829272-1-Tze-nan.Wu@mediatek.com>
 <20250410210507.GD15280@redhat.com>
 <249567d33e088a340780456c7ecd3ef3ee1433a1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <249567d33e088a340780456c7ecd3ef3ee1433a1.camel@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_095141_571990_218347B3 
X-CRM114-Status: GOOD (  16.12  )
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

On 04/14, Tze-nan Wu (吳澤南) wrote:
>
> On Thu, 2025-04-10 at 23:05 +0200, Oleg Nesterov wrote:
> > 
> > As for sys_reboot(), I think that kernel_power_off() must be
> > __noreturn,
> > and sys_reboot() should use BUG() after
> > LINUX_REBOOT_CMD_POWER_OFF/_HALT
> > instead of do_exit().
> > 
> 
> Yes, kernel_power_off() should not return, but this is the case only if
> kernel_power_off() is invoked by PID 1 through sys_reboot().
> If kernel_power_off() is invoked by a kernel thread (e.g., the thermal
> kernel module) other than PID 1, then do_exit() could possibly be
> invoked by PID 1 after kernel_power_off() on another CPU.

Yes sure, this is clear.

I have mentioned sys_reboot() because (unless I am totally confused)
this connects to the previous report from Breno.

And I agree that we should do stop_other_cpus() first, but let me
say this again: I can't help ;)

But in any case, rightly or not I still think that the init process
should not exit/crash due to POWER_OFF/HALT. We should not mask this
problem in do_exit().

Oleg.


