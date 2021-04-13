Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF326C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 09:54:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A317D613B6
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 09:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A317D613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OIdegv9FLtZGWGKymlCcP4G8bukowNHe14IV28+QXhE=; b=Ag7JaE2w/Tn6iVGeBEKEmCCfI
	Gx2DQ6/ApD2poGAxIQXE+o/gjzWNvrlEPLQoMfHTtivoYsKVEqLyeqL3SM/18agf1GCziqMvzpqE8
	hcn7fja0+96spAjQ3Jpq2k4RqApvhHNSaq0z8KuEy1cqTsbqjAsoyvGXsP53X5tEhfKf2633BUsqg
	hL0QIgC1xc3OocrLd8F9uQ4ebC4P0kiwzJB4a/rJREHR6H9UvmoOkTdUngFyKrp7vajs+darYw2sU
	HEtnrJiEvYeGXaftStWktZMBfbvHQMmRje7s+shqEHpjzBM6VMvCl4wjHJP4MpyCNxOr71YeMKW4C
	+GNWXBWGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFkB-008nmI-Fk; Tue, 13 Apr 2021 09:54:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFjY-008ngb-OZ; Tue, 13 Apr 2021 09:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2Jtdc8lJB5XtI2zmnqgGFDcqbh+tqcK9vJZMrXfmLto=; b=r5DX4SvXUVSDSOLOfUbxjxagfM
 CkgnuUm8+aJJQC/5ztP8UBnhkN/iE6IjMhgPCW3FHaR6a7AXerOR4XMGMV8W5NFwtE5S7m+uYegch
 vmCsAwWxRvrmk4UZnmPbLTvQ/CHW3sJI03BpL55WmhXSjZjl8lZDgmq6nTYzkx1/fE9BJD39QCfwD
 Rd1Z3/hJtfTe1W/ytXEobY3ompdscw1VM0ovBI0oMbN0WFQO8Jsir8sRqZApuWnNjo/lHjENZHSV5
 TAgRHqeZE5kvRqVfmOSmtuRxFb+InIfKjFGAvmr1M0FrOfPKWLZ06Jpyzr2C3qUDz4NIhSwFEM0oy
 zfC8l6VQ==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFjW-006uA3-0A; Tue, 13 Apr 2021 09:53:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AFE1106F;
 Tue, 13 Apr 2021 02:53:18 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACB7B3F73B;
 Tue, 13 Apr 2021 02:53:15 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:53:05 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>
Subject: Re: [v9,2/7] PCI: Export pci_pio_to_address() for module use
Message-ID: <20210413095257.GA21802@lpieralisi>
References: <20210324030510.29177-1-jianjun.wang@mediatek.com>
 <20210324030510.29177-3-jianjun.wang@mediatek.com>
 <20210324090942.kmhxnxzm7tz3ynuy@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324090942.kmhxnxzm7tz3ynuy@pali>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_025322_114132_97290791 
X-CRM114-Status: GOOD (  18.12  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 24, 2021 at 10:09:42AM +0100, Pali Roh=E1r wrote:
> On Wednesday 24 March 2021 11:05:05 Jianjun Wang wrote:
> > This interface will be used by PCI host drivers for PIO translation,
> > export it to support compiling those drivers as kernel modules.
> > =

> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > ---
> >  drivers/pci/pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> > =

> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 16a17215f633..12bba221c9f2 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -4052,6 +4052,7 @@ phys_addr_t pci_pio_to_address(unsigned long pio)
> >  =

> >  	return address;
> >  }
> > +EXPORT_SYMBOL(pci_pio_to_address);
> =

> Hello! I'm not sure if EXPORT_SYMBOL is correct because file has GPL-2.0
> header. Should not be in this case used only EXPORT_SYMBOL_GPL? Maybe
> other people would know what is correct?

I think this should be EXPORT_SYMBOL_GPL(), I can make this change
but this requires Bjorn's ACK to go upstream (Bjorn, it is my fault,
it was assigned to me on patchwork, now updated, please have a look).

Thanks,
Lorenzo

> >  =

> >  unsigned long __weak pci_address_to_pio(phys_addr_t address)
> >  {
> > -- =

> > 2.25.1
> > =


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
