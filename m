From: Kristian Evensen <kristian.evensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Questions about bringing up MT7623 board
Date: Mon, 12 Feb 2018 13:02:57 +0100
Message-ID: <CAKfDRXgNGRHu9JMs-9vb4n72w+PmR8buqDnz8ObEQNXtP1pM4w@mail.gmail.com>
References: <CAKfDRXhhrndoKMidZYsw=E8BmS7AFsTJHbS4dcYbEoADhjD44Q@mail.gmail.com>
 <CAKfDRXg0jeHP9xZRGDNm5tfW1afZd-TPfwbwUzEPiWsy_bfuUQ@mail.gmail.com>
 <fc2bf32a-eb81-6cd1-9085-b8786ddf0f9c@phrozen.org>
 <CAKfDRXjpG4CNeHfKC1Kg=6mrqUTZ8A7bD1aivLkSQ2L0eK755Q@mail.gmail.com>
 <6ae4103b-45bf-c427-d0d9-87f6f4eb83b5@phrozen.org>
 <CAKfDRXiJCMpA+qj4HmoSg0F_Yt4LnjQ=Dvy_tkxa=Dnh_pN13g@mail.gmail.com>
 <a594ffaa-4098-4171-f824-1aa3f332c9fc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <a594ffaa-4098-4171-f824-1aa3f332c9fc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi,

On Mon, Feb 12, 2018 at 12:08 PM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>
> On 02/11/2018 11:55 AM, Kristian Evensen wrote:
>> Hi,
>>
>> On Sun, Feb 11, 2018 at 11:41 AM, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org> wrote:
>>> Is Earlyprinkt enabled in the kernel .config ?
>>
>> No, turns out CONFIG_EARLY_PRINTK was not enabled. This is the first
>> time I am trying to add support for a board outisde the safe walls of
>> OpenWRT, so sorry for such a rookie mistake.
>>
>
> More then a rookie mistake for me it's kind of an overlook which can cost you
> half a day. This kind of errors at least to me they happens on a semi-regular
> basis :)

Good to know I am not the only one that has made this mistake :)

My plan now is to start with John's 4.14 mediatek support when
available and getting my board up with OpenWRT, then sending an RFC
with the DTS to the list. Once all of that is ready, I will look into
how I can partition the eMMC on my board so that I can install a
"normal" rootfs and make the board work with the mainline kernel. I am
sure I will have lots of questions, so this is probably not my last
email :)

BR,
Kristian
