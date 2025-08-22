Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C75CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Aug 2025 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwoDIPqySHCxoAtf53CxPWWZ9nUZ9E6x5thuYUbBCf4=; b=y5GmYoTfQea6f9LoopQvasGxRE
	SJ3Aw2tO3yEwcJc0IX18Mp67qDOTmYJjGgO3bsw3/zdVBML4oXOinUqCt1Ad/nK+wgbBpLf/3k45M
	fxU+pZyt9UA2m0LrH4aiult0XgygIp7i4bsSe+3/yJ2H0VLLDapigqDPp8ET/Gg8ZREmcoQhTJv0H
	OI00IyTrxMtXBPzds3OVvMeycDQrNO8l+4M4OnuxBqox88TJLKYDxm4ncAD8UkpeP9wEXWikMzjRa
	nsF2gHzSjcpg/yuGdfYKp5pfaXZ5U6a/pbJARygdquG4FNs+wcxKeZDZ+JohuJRbHI78QOQ1YKm9U
	uvKcynYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphmR-00000003zxw-1mrX;
	Sat, 23 Aug 2025 06:31:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSNm-00000002iF4-0Niz;
	Fri, 22 Aug 2025 14:04:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 579ACA583DA;
	Fri, 22 Aug 2025 14:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB16DC4CEED;
	Fri, 22 Aug 2025 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755871481;
	bh=lnXfUbhwjwvmKYPmzSa4znMTh2n6CcVoBz5/ntha/kQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OFVLq/5+Ub4dj8tgte5CU3YyS+G3fbUUCVHF/U0fN2r4VHg5Qc2QgGjsZX6ikjnRX
	 rwoJO+kNO+WT2C9Il4VcHqV9qGPlniquUYMxTaYPBFGsMalkVoT4P3yB4me7+FQxJO
	 Ztkhi1ObxOocGbxM/jgyg44dUPONEq78O8ThI7eikBEXCREwhB030j+FXrdPhDYvP1
	 SMASRyL/17cuNSMhyxVz5mBEto4pcz5tDDZEX7yRo9ihT7kpqXFLbITPtTAAqwnOAr
	 7AOUvOW3X9kahbJk6a0IDLbfWFPKxadajkDdF0MhGTvd3hlBjdaUDsRBuLnt9ToNRQ
	 /kIyrUWIcuj/Q==
Date: Fri, 22 Aug 2025 07:04:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
Message-ID: <20250822070440.71bdd804@kernel.org>
In-Reply-To: <aKgVEYMftYgdynxw@lore-rh-laptop>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
	<20250819-airoha-en7581-wlan-rx-offload-v1-2-71a097e0e2a1@kernel.org>
	<20250821183453.4136c5d3@kernel.org>
	<aKgVEYMftYgdynxw@lore-rh-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_070442_196993_7B8795C8 
X-CRM114-Status: GOOD (  12.10  )
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

On Fri, 22 Aug 2025 08:58:25 +0200 Lorenzo Bianconi wrote:
> > On Tue, 19 Aug 2025 14:21:07 +0200 Lorenzo Bianconi wrote:  
> > > +	pdev = of_find_device_by_node(np);
> > > +  
> > 
> > did you mean to put the of_node_put() here?
> >   
> > > +	if (!pdev) {
> > > +		dev_err(dev, "cannot find device node %s\n", np->name);
> > > +		of_node_put(np);
> > > +		return ERR_PTR(-ENODEV);
> > > +	}
> > > +	of_node_put(np);  
> 
> I moved the of_node_put() here (and in the if branch) in order to fix a similar
> issue fixed by Alok for airoha_npu.

Ah, didn't notice it in the print..
maybe remove the empty line between the of_find_device.. and the null
check on pdev then?

