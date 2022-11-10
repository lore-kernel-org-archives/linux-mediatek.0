Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D39C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16Tw1zPwIJX0LOjxziI4qGFph7FkOhTOdwaCIO6qXhc=; b=wcPcW5Y1kEJ7xC4ajPt3Mu7f/o
	q/1QcmQJz13zRSTYllPikoZ41MOutqMJIz+hhHvOeio7UqbsIzWi0q/KZfCDpnsHyDXw3IYnY4VIo
	ucg/3sWAG7WdojwLLAHgIMrnTjb/mQT7TrfVY9dzI+vL8+A7J5F2rNzdV0BmTzBbHtiI6zqeeFGZo
	2n4U1oEeNe9DgTvsv6iqnwkyMswjj3UwYsXNayWsjZTmldBXeNpzQT5fcv7bz05e500Ij1dkfdBir
	S9Arm7+IUcJsBdaw2qhfh2EDq2TsdVnP3Zlpu+M/K30nuZ5pQCVGfus3JEo+hm/2gdPyQKa02gJGP
	/fEpgeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCv0-008W7w-TJ; Thu, 10 Nov 2022 19:08:54 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otCq3-008SHX-Pg; Thu, 10 Nov 2022 19:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=16Tw1zPwIJX0LOjxziI4qGFph7FkOhTOdwaCIO6qXhc=; b=Ci8sKtKRR96YW4AlfISS6ZISVP
	7J6V8MjZeQ+lW/W0SVO60006w0t1ouR6FhmFEao20UfaCgnkum0PnVBMtutqjzZG1MUc+1+U7Af6P
	tvP6etw/8vaJ+3nut6l3P0gdza7vXTnbPRQiRK0H57q5fuTkY2LuEr+0+oGRwfxICSrM=;
Received: from p200300daa72ee10c199752172ce6dd7a.dip0.t-ipconnect.de ([2003:da:a72e:e10c:1997:5217:2ce6:dd7a] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1otCpw-0010K3-CZ; Thu, 10 Nov 2022 20:03:40 +0100
Message-ID: <472709c2-a58e-0af0-59f6-7ff504e38d44@nbd.name>
Date: Thu, 10 Nov 2022 20:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH net-next v2 00/12] Multiqueue + DSA untag support + fixes
 for mtk_eth_soc
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221109163426.76164-1-nbd@nbd.name>
 <Y21H22Geh0a0pcta@shell.armlinux.org.uk>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <Y21H22Geh0a0pcta@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_110347_900078_D2AF93A6 
X-CRM114-Status: GOOD (  15.01  )
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

Hi Russell,

On 10.11.22 19:50, Russell King (Oracle) wrote:
> Hi Felix,
> 
> Not directly related to your patch series, but as you seem to be
> tinkering with the driver, it seems appropriate to ask. Are you
> using hardware that uses RGMII? If not, do you know anyone who is?
> 
> It would be good to fix mtk_mac_config(), specifically the use
> of state->speed therein - see the FIXME that I placed in that
> function. Honestly, I think this code is broken, since if the
> RGMII interface speed changes, the outer if() won't allow this
> code path to be re-executed (since mac->interface will be the
> same as state->interface for speed changes.)
The only device I'm aware of which uses RGMII has the RGMII port 
connected to a switch with no proper upstream driver support - no speed 
changes expected there.

- Felix

