Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39EFC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9900460F6D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9900460F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLmvF+Gq9OxU3QwDqAq30NN+OaO3zUgmgyiq5fRCfUg=; b=D53D5NVWWEFp4o
	v049+6R8698FLAV8s5VkOrq8nqQmPOKACGneKmrIQyvxLs6pgZKhDGV4NQKL+vFJJSlB2gHnCtAGq
	emx24tN1JgvURlC6Q6J3XU1gwt48kHNQVSIref5Ldmx/h+1K5Eirdh1lxIm2Mh6uplyzPsluNaq4i
	uW/d5PQMBE9exceEBpu9mIk/nK79wEtzhMT5RLl3GgmrXGImr45dZTohuNkSAzXpIoCmB1lk8S+Ri
	BDfFDt5+4kkELeRXXfOlBi+hy6dNlhpubzZQC7MRDOM3N8hFkkoUhPHD00obt0bFOiLt1mkyKp2Ce
	CMiuK87JjstK/Xjz3dwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAXaE-00GI4O-2T; Mon, 02 Aug 2021 13:02:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAXa9-00GI2Z-Uu; Mon, 02 Aug 2021 13:02:15 +0000
X-UUID: c15ef3b65dc04fd6bf9088479b1bdf95-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mjfmxFeVls5H/e8H8DAAYokw+x9ZHbmkHst8iBhYLVU=; 
 b=LT41OpDlAM6gBw5A3iG/fqMxXKHwpGD/pKAe9jXdzhxf0b576X0LtRDy0Xk0aP+/8eFj029eOOgpshavMRLAXWukoUijmRUUTIcSwu6QzlApDS4Z5fhvCpulmN1lW2WtIClJtmYhkhvA2jn6W+VuXSIYflnyNf3/UHFS0zTFqg4=;
X-UUID: c15ef3b65dc04fd6bf9088479b1bdf95-20210802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 623239643; Mon, 02 Aug 2021 06:02:10 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 05:57:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 20:57:08 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 2 Aug 2021 20:57:07 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: David Ahern <dsahern@kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <rocco.yue@gmail.com>, <chao.song@mediatek.com>,
 <zhuoliang.zhang@mediatek.com>, Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next v2] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
Date: Mon, 2 Aug 2021 20:40:39 +0800
Message-ID: <20210802124039.13231-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210802031924.3256-1-rocco.yue@mediatek.com>
References: <20210802031924.3256-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_060214_052217_B710B45D 
X-CRM114-Status: GOOD (  13.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2021-07-31 at 11:17 -0600, David Ahern wrote:
On 7/30/21 7:52 PM, Rocco Yue wrote:

> IFLA_INET6_RA_MTU set. You can set "reject_message" in the policy to
> return a message that "IFLA_INET6_RA_MTU can not be set".

Hi David,

Regarding setting "reject_message" in the policy, after reviewing
the code, I fell that it is unnecessary, because the cost of
implementing it seems to be a bit high, which requires modifying
the function interface. The reasons is as follows:

The parameter "struct netlink_ext_ack *extack" is not exposed in the
function inet6_validate_link_af(), and the last argument when calling
nla_parse_nested_deprecated() is NULL, which makes the user space not
notified even if reject_message is set.

static int inet6_validate_link_af(...)
{
...
	err = nla_parse_nested_deprecated(tb, IFLA_INET6_MAX, nla,
					  inet6_af_policy, NULL);
...
}


Only when extack is not NULL, reject_message is valid.

static int validate_nla(...)
{
...
	switch (pt->type) {
	case NLA_REJECT:
		if (extack && pt->reject_message) {
			NL_SET_BAD_ATTR(extack, nla);
			extack->_msg = pt->reject_message;
			return -EINVAL;
		}
		err = -EINVAL;
		goto out_err;
...
}


Thanks
Rocco
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
