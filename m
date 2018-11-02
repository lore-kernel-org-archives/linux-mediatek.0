From: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH v4] mm/page_owner: clamp read count to PAGE_SIZE
Date: Thu, 1 Nov 2018 18:41:33 -0600
Message-ID: <FD1082D9-916E-47A4-95D3-59F308AD6D55@oracle.com>
References: <1541091607-27402-1-git-send-email-miles.chen@mediatek.com>
 <20181101144723.3ddc1fa1ab7f81184bc2fdb8@linux-foundation.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181101144723.3ddc1fa1ab7f81184bc2fdb8@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: miles.chen@mediatek.com, Michal Hocko <mhocko@suse.com>, Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Michal Hocko <mhocko@kernel.org>
List-Id: linux-mediatek@lists.infradead.org



> On Nov 1, 2018, at 3:47 PM, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> -	count =3D count > PAGE_SIZE ? PAGE_SIZE : count;
> +	count =3D min_t(size_t, count, PAGE_SIZE);
> 	kbuf =3D kmalloc(count, GFP_KERNEL);
> 	if (!kbuf)
> 		return -ENOMEM;

Is the use of min_t vs. the C conditional mostly to be more =
self-documenting?

The compiler-generated assembly between the two versions seems mostly a =
wash.

    William Kucharski=
