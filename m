Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4507AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 14:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey1AQpHQJmLwWlHR7WvCo+Mh7OBWJhTN7kBM9O932Lk=; b=0W3l+yF2pFXsx03tfm5NWF/9pr
	66u6pwgJU1Jw4ln2KEQ9UIKl29hflnW45tsbc4Yh8igsI8X05n2GCPhjTWHJIWDVQm9KAOsVGxCQX
	Lnkf3iO/mA9TuYUJUl5OkNu9zyAn+uDXEZYiPJPICU5XPPnnpP3lMg1DcYpy7H5eyH9fpYjfXl+zl
	QlessE2MSs+YMUbRjUDwHBqggN0H84En8NFHXCqW27e3D44eaXXcvw76CYBc3IM21+OkvvPxzEKt7
	mWSnuz9ijFYY+b9l5pMltTM7evcCoMnFQaWftPJA4a/jIGaSe5A+qBIi/ixHcHSCgvZMeWugDjLdO
	YDvWtoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot8aS-006Oc2-Tr; Thu, 10 Nov 2022 14:31:24 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot8aH-006OXg-2S; Thu, 10 Nov 2022 14:31:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id o4so2519559wrq.6;
        Thu, 10 Nov 2022 06:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ey1AQpHQJmLwWlHR7WvCo+Mh7OBWJhTN7kBM9O932Lk=;
        b=lKVxtGAF6KgZ9znDKbiDgn+29vfeR/baAnBRLSwXGwS8lrJK5dFBom2qqIAcD4iZ07
         4gWDWd/O2+CmLLlMR1NzXypB1WL7giM2k5jlsCTabTOmgSYtP8zxYBU0WXQ2K0/awMa9
         iMW0blvOuwz1ugGR50/KPaMg4xpD+JWT7EMVpW5Vs/qQgtSfdxiWZwtgekjI2rFlSOBV
         Yl6Emh7wKEaacMNqWVQ1CLAzHGwFoPh0euQzAO4EIM2AhyzpSIx4tSosmvFp6nMduRDm
         oZR2+4KR3iRRhaMUDANYewdq2JZMXzAZ4XwAqBdCOV56Z53mJRdhICxK1HIuUHFXwtX4
         87Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ey1AQpHQJmLwWlHR7WvCo+Mh7OBWJhTN7kBM9O932Lk=;
        b=UG1X0wIiy4Za6Ihqm2+DpqOd1oKhqWZpLdQhDHmhlLWf2qLtxY+oTH8suKmtud1pnx
         nN1RGNO1xSGEEasYm2t0IhKbkNxyB4VvUCS0lrXrCtb8ZkDsbb0QmxRkZjtIpNBqsGZ4
         F2YhH9WaAzop2j7ZxX0GDdGTnH8JRMaZOH4BrNRdY3qVsgwLdohYjK9sRvBBWgGThRvS
         0+3S7imv/JU+9cjDrkmGoLgHTYmNJmkg7J4u7O/bxeggwkr7DJ5TQ4aXS9gUfCx0Nsk5
         3OtrHEJjlhW7Cx17uZLgQgJFRoVvK5edOGVA+nRvOsQWKTEMT7NnfEJ6nr4PvGvX/f6T
         cfmQ==
X-Gm-Message-State: ACrzQf0kU4KtFMK7vdCLqrw/lJP7i5tjYkvoJoPU1YBwEGGjgL5szpNx
	rWBQvVsPMBGXtNutavWLims=
X-Google-Smtp-Source: AMsMyM7wiH890UFM7ywsgSihfawl87lkuRK49fnsLmY/LuBzeAlWQzUPXBhrbPCLkwy03Rd1GBfUwQ==
X-Received: by 2002:a5d:5d87:0:b0:22a:bbc5:5afe with SMTP id ci7-20020a5d5d87000000b0022abbc55afemr41324229wrb.235.1668090669749;
        Thu, 10 Nov 2022 06:31:09 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id h17-20020adff191000000b00236488f62d6sm15801731wro.79.2022.11.10.06.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:31:09 -0800 (PST)
Date: Thu, 10 Nov 2022 16:31:07 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 01/12] net: ethernet: mtk_eth_soc: account
 for vlan in rx header length
Message-ID: <20221110143107.335esdtwbfqy7ktu@skbuf>
References: <20221109163426.76164-1-nbd@nbd.name>
 <20221109163426.76164-2-nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109163426.76164-2-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_063113_129511_D34FA9B9 
X-CRM114-Status: UNSURE (   8.65  )
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

On Wed, Nov 09, 2022 at 05:34:15PM +0100, Felix Fietkau wrote:
> The network stack assumes that devices can handle an extra VLAN tag without
> increasing the MTU
> 
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

